function [timeVec, concMatrix, fluxMatrix] = solveOdeMmBranch(tStart,tEnd,nT,x0,params)
% This function is hard-coded to integrate the branched pathway model as an
% ODE with Michaelis-Menten kinetic rate laws described in the
% Supplementary Methods. 
%
% Written by R.A. Dromms 2015-07-29

    if exist('params','var')
        params = convertOdeParams(params);
    else
        params = setOdeParams;
    end
    
    [timeVec,concMatrix] = ode45(@(t,x)fRHS(t,x,params),linspace(tStart,tEnd,nT+1),x0');
    
    fluxMatrix = zeros(length(timeVec),10);
    for k = 1:length(timeVec)
        fluxMatrix(k,1:5) = calcFluxes(timeVec(k),concMatrix(k,:)',params)';
        fluxMatrix(k,6:10) = fRHS(timeVec(k),concMatrix(k,:)',params)';
    end
    
end

function xdot = fRHS(~,x,params)

    v = calcFluxes([],x,params);
    
    xdot = params.S*v; 

end

function v = calcFluxes(~,x,params)
    
    % Bad Things can happen with the math when we allow negative x
    % (Which isn't physically relevant, anyways)
    xMin = 1e-4;
    x(x<xMin) = xMin;

    v(1,1) = params.v0;
    v(2,1) = params.v2M * x(1) / (params.v2K + x(1)) ;
    v(3,1) = params.v3M * x(2) / ((params.v3I + x(4))   * (params.v3K + x(2)));
    v(4,1) = params.v4M * x(1) / ((params.v4A + 1/x(3)) * (params.v4K + x(1)));
    v(5,1) = params.v5M * x(3) * x(4) / (params.v5K + params.v53*x(3) + params.v54*x(4) + x(3)*x(4)) ;
    
end

function params = convertOdeParams(paramVec)
% ParamVec = [bm3; bm4; v2M; v2K; v3M; v3I; v3K; v4M; v4A; v4K; v5M; v5K; v53; v54]

    paramVec = paramVec(:);

    bm3 = paramVec(1);
    bm4 = paramVec(2);
    
    params.S = [ 1 -1  0 -1  0   ;
                 0  1 -1  0  0   ;
                 0  0  1  0 -bm3 ;
                 0  0  0  1 -bm4 ;
                 0  0  0  0  1   ];

    params.v0 = 1;
    
    params.v2M = paramVec(3);
    params.v2K = paramVec(4);
    params.v3M = paramVec(5);
    params.v3I = paramVec(6);
    params.v3K = paramVec(7);
    params.v4M = paramVec(8);
    params.v4A = paramVec(9);
    params.v4K = paramVec(10);
    params.v5M = paramVec(11);
    params.v5K = paramVec(12);
    params.v53 = paramVec(13);
    params.v54 = paramVec(14);
    
end
