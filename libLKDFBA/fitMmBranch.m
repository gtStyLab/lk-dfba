function [x0] = fitMmBranch(odeTimeVec,odeConcMatrix,odeFluxMatrix,weightVector,stoichVars)
% This function is hard-coded to identify parameters for the branched
% pathway model represented by the Michaelis-Mented kinetic rate laws
% described in the Supplementary Text.
%
% Written by R.A. Dromms 2015-10-05

    if size(odeFluxMatrix,1) == size(odeConcMatrix,1)-1
        odeConcMatrix(end,:) = [];
        odeTimeVec(end) = [];
    end
    
    % Set up stuff for the specific problem
    nT = length(odeTimeVec);
    
    % Set up the non-linear regression
    maxFunEvals = 1200;
    solverOpts = optimoptions('lsqcurvefit','Display','off','MaxFunEvals',maxFunEvals);
    
    numTries = 100;
    
    paramsOptimal = cell(numTries,1);
    residuals = zeros(numTries,1);
    numParams = 14;
    LB = [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
    UB = [inf, inf, inf, inf, inf, 1, inf, inf, inf, inf, inf, inf, inf, inf];
        
    for k = 1:numTries
    % Perform a nonlinear regression using rate law formulas
        initialParams = rand(numParams,1);
        initialParams(7) = initialParams(7) + 1;
        [paramsOptimal{k}, residuals(k)] = lsqcurvefit(@calcFluxes,initialParams,odeConcMatrix(1:nT,:),odeFluxMatrix(1:nT,2:5),LB,UB,solverOpts);
    end
    
    [~, idx] = min(residuals);
    
    x0 = paramsOptimal{idx};
        
end

function fluxMatrix = calcFluxes(params,concMatrix)

%     params(1) = v2M;
%     params(2) = v2K;
%     params(3) = v3M;
%     params(4) = v3K;
%     params(5) = v3A;
%     params(6) = v3alpha;
%     params(7) = v3beta;
%     params(8) = v4M;
%     params(9) = v4K;
%     params(10) = v4I;
%     params(11) = v5M;
%     params(12) = v5K;
%     params(13) = v53;
%     params(14) = v54;

    % We only need to calculate the flux values to do the fitting here
    for k = 1:size(concMatrix,1)
        fluxMatrix(k,1) = params(1) * concMatrix(k,1) / (params(2) + concMatrix(k,1)) ;
        fluxMatrix(k,2) = params(3) * concMatrix(k,2)...
            / (params(4) * ((1 + concMatrix(k,4) / params(5)) / (1 + params(7) * concMatrix(k,4) / (params(6) * params(5))))...
            + concMatrix(k,2) * ((1 + concMatrix(k,4) / (params(6) * params(5))) / (1 + params(7) * concMatrix(k,4) / (params(6) * params(5)))));
        fluxMatrix(k,3) = params(8) * concMatrix(k,1) / ((1 + concMatrix(k,3) / params(10)) * (params(9) + concMatrix(k,1)));
        fluxMatrix(k,4) = params(11) * concMatrix(k,3) * concMatrix(k,4) / (params(12) + params(13)*concMatrix(k,3) + params(14)*concMatrix(k,4) + concMatrix(k,3)*concMatrix(k,4)) ;
    end
end

function totalError = calcParamsError(paramsGuess,odeTimeVec,odeConcMatrix,odeFluxMatrix,weightVector)

    penaltyWeightReg = 1e-2; % Parameter Regularization penalty
    penaltyWeightImag = 1e10; % Let's try a *hefty* penalty on imaginary terms
    
    [modelTimeVec,modelConcMatrix,modelFluxMatrix] = solveOdeMm(odeTimeVec(1),odeTimeVec(end),length(odeTimeVec)-1,odeConcMatrix(1,:),paramsGuess);
    
    % If something went negative during the ODE solver and it halted the
    % ODE solution trajectory, then we need to fill in junk for after so
    % that we can calculate error --> fill in the matrix with the last
    % value, which should produce a large error in the subsequent error
    % calculation steps, pushing us away from these parameters.
    if length(modelTimeVec) < length(odeTimeVec);
        modelConcMatrix(length(modelTimeVec)+1:length(odeTimeVec),:) = repmat(modelConcMatrix(length(modelTimeVec),:),length(odeTimeVec)-length(modelTimeVec),1);
        modelFluxMatrix(length(modelTimeVec)+1:length(odeTimeVec),:) = repmat(modelFluxMatrix(length(modelTimeVec),:),length(odeTimeVec)-length(modelTimeVec),1);
    end
    
    try
        % Crunch our fitting error
        errorConcVec = sum((modelConcMatrix-odeConcMatrix).^2,1);
        errorFluxVec = sum((modelFluxMatrix-odeFluxMatrix).^2,1);
        
        totalError = nansum(weightVector .* [errorConcVec errorFluxVec]);
                     
        totalError = totalError + penaltyWeightReg * sum((paramsGuess(:)).^2)...
                                + penaltyWeightImag * sum(imag(modelConcMatrix(:)).^2);
    catch
        % If we ended up here, then the conc Matrix is empty? --> ODE error
       totalError = inf;
    end
    
end
