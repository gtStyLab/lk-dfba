function [timeVec, concMatrix, fluxMatrix] = solveOdeBstBranch(tStart,tEnd,nT,x0,params)
% This function is hard-coded to integrate the branched pathway model as an
% ODE with Biochemical Systems Theory kinetic rate laws described in the
% Supplementary Methods.
%
% Written by R.A. Dromms 2015-07-29

    if ~any(imag(params(:)))
        
        if exist('params','var')
            params = convertOdeParams(params);
        else
            params = setOdeParams;
        end

        [timeVec,concMatrix] = ode15s(@(t,x)fRHS(t,x,params),linspace(tStart,tEnd,nT+1),x0',odeset('NonNegative',ones(size(x0'))));

        fluxMatrix = zeros(length(timeVec),10);
        for k = 1:length(timeVec)
            fluxMatrix(k,1:5) = calcFluxes(timeVec(k),concMatrix(k,:)',params)';
            fluxMatrix(k,6:10) = fRHS(timeVec(k),concMatrix(k,:)',params)';
        end
    else
        timeVec = [];
        concMatrix = [];
        fluxMatrix = [];
    end
end

function xdot = fRHS(~,x,params)

    x = real(x);
    x(x<0) = 0;
    
    v = calcFluxes([],x,params);
    xdot = params.S*v;
    
end

function v = calcFluxes(~,x,params)
    
    minVal = 1e-3;
    
    v(1,1) = params.v0;
    
    if x(1) < minVal
        v(2,1) = 0;
    else
        v(2,1) = params.a2*x(1)^params.b21;
    end
        
    if x(2) < minVal || x(4) < minVal
        v(3,1) = 0;
    else
        v(3,1) = params.a3*x(2)^params.b32*x(4)^params.b3r4;
    end
    
    if x(1) < minVal; % ||  x(3) < minVal 
        v(4,1) = 0;
    else
        v(4,1) = params.a4*x(1)^params.b41*x(3)^params.b4r3;
    end
    
    if x(3) < minVal ||  x(4) < minVal
        v(5,1) = 0;
    else
        v(5,1) = params.a5*x(3)^params.b53*x(4)^params.b54;
    end
    
end

function params = convertOdeParams(paramVec)
% ParamVec = [bm3; bm4; a2; b21; a3; b32; b3r4; a4; b41; b4r3; a5; b53; b54]; 

    paramVec = paramVec(:);

    bm3 = paramVec(1);
    bm4 = paramVec(2);
    
    params.S = [ 1 -1  0 -1  0   ;
                 0  1 -1  0  0   ;
                 0  0  1  0 -bm3 ;
                 0  0  0  1 -bm4 ;
                 0  0  0  0  1   ];

    params.v0 = 1;
    
    params.a2 = paramVec(3);
    params.b21 = paramVec(4);
    params.a3 = paramVec(5);
    params.b32 = paramVec(6);
    params.b3r4 = paramVec(7);
    params.a4 = paramVec(8);
    params.b41 = paramVec(9);
    params.b4r3 = paramVec(10);
    params.a5 = paramVec(11);
    params.b53 = paramVec(12);
    params.b54 = paramVec(13);

end
