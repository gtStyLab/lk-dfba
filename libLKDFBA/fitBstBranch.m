function [dynamicsParamsOptimal] = fitBstBranch(odeTimeVec,odeConcMatrix,odeFluxMatrix,weightVector,stoichVars,paramBounds)
% This function is hard-coded to identify parameters for the branched
% pathway model represented by the biochemical systems theory kinetic rate
% laws.
%
% Written by R.A. Dromms 2015-10-05

    if size(odeFluxMatrix,1) == size(odeConcMatrix,1)-1
        odeConcMatrix(end,:) = [];
        odeTimeVec(end) = [];
    end

    % Set up stuff for the specific problem
    nT = length(odeTimeVec);
    
    % For BST, we can take linearize the system to directly fit the parameters.
    % X = [log(a2); b21; log(a3); b32; b3r4; log(a4); b41; b4r3; log(a5); b53; b54]
    
    % Note: This form assumes the particular BST toy system structure
    A1 = [ones(nT,1), log(odeConcMatrix(1:nT,1))];
    A2 = [ones(nT,1), log(odeConcMatrix(1:nT,2)), log(odeConcMatrix(1:nT,4))];
    A3 = [ones(nT,1), log(odeConcMatrix(1:nT,1)), log(odeConcMatrix(1:nT,3))];
    A4 = [ones(nT,1), log(odeConcMatrix(1:nT,3)), log(odeConcMatrix(1:nT,4))];
    A = blkdiag(A1, A2, A3, A4);
    b = reshape(log(odeFluxMatrix(:,2:5)),[numel(odeFluxMatrix(:,2:5)),1]);

    % Solve for linearized best fit
    x = A\b;
    
    % Switch a terms out of log-space
    x([1 3 6 9]) = exp(x([1 3 6 9]));
    
    dynamicsParamsOptimal = x;
 
end

