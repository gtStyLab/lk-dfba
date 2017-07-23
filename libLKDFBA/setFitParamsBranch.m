% This script sets default fitting parameters for the branched pathway
% model.

% Single pass, all variables
fitOptions.fixedParameterSequence = [0,0,0,0,0,0;]';

% Multiple seeds per pass, with small perturbations added
fitOptions.nTries = 8;
fitOptions.nTriesPerturbation = 1e-4;

% Specify matlab solver function
fitOptions.solverType = 'fminsearch';

% Specifies L2 penalty on parameter vector (regularization)
fitOptions.penaltyWeight = 1e-2;

% Specifies if the reference vector for parameter regularization is the
% zero vector or the LR-method initial guess
fitOptions.useNonzeroRegularization = true;

% These bounds on parameters represents known signs for regulatory a's:
fitOptions.pLB   = [   0,    0,    0,    0, -inf,    0;
                    -inf, -inf, -inf, -inf, -inf, -inf  ]';
fitOptions.pUB   = [ inf,  inf,  inf,  inf,    0,  inf;
                     inf,  inf,  inf,  inf,  inf,  inf  ]';

% Verbose output for fitting progress?
fitOptions.fitProgressDisplay = 'off'; % Options are: 'iter', 'final', 'off', and 'diagnose'
                 
% Options if I'm using the GA
% % fitOptions.gaPopulationSize = 40;
% % fitOptions.gaGenerations = 2400;
% % fitOptions.gaSecondaryOptimization = false;
