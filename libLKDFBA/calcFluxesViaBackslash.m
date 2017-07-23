function [fluxMatrixOut] = calcFluxesViaBackslash(fluxMatrixIn,STM,fixedFluxes)
% This function calculates the system fluxes over time as a function of the
% pooling fluxes at each time point and the system stoichiometry. Since
% noise and smoothing may cause violation of the mass balance contraints,
% the calculation is performed using MATLAB's backslash syntax.
%
% fluxMatrix in is an nT-by-numAugmentedFluxes matrix, and so includes
% numMetabs pooling fluxes in addition to numSysFluxes system fluxes.
%
% STM is the original system stoichiometric matrix, such that for each time
% point, d/dt x = STM*v, where x is the metabolite concentration vector,
% and v is the vector of system fluxes.
%
% Written 2016-08-05 by R.A.Dromms

    fluxMatrixOut = fluxMatrixIn;
    numSysFluxes = size(STM,2);
    poolingFluxMatrix = fluxMatrixIn(:,numSysFluxes+1:end);
    
    % We need to augment the RHS to subtract out the fixed fluxes
    % according to:
    % R_i,k = A_f * v_f,k  +  A_v * v_v,k
    % Where:
    % R_i,k = d/dt x_i at time k
    % A_f is the fixed fluxes STM
    % A_v is the STM for varying fluxes (what we're solving for)
    % v_f,k is the fixed flux vactor at time k
    % v_v,k is the flux vactor we're solving for (at time k)
    
    % Create two separate STMs, one each for fixed and non-fixed fluxes
    stmFixed = STM(:,fixedFluxes);
    stmVaried = STM(:,~fixedFluxes);
    fixedFluxMatrix = fluxMatrixIn(:,fixedFluxes);
    
    % For each t_k, backsolve the system
    for k = 1:size(fluxMatrixIn)
        fluxMatrixOut(k,find(~fixedFluxes)) = (stmVaried\(poolingFluxMatrix(k,:)' - stmFixed*fixedFluxMatrix(k,:)'))';
    end

end
