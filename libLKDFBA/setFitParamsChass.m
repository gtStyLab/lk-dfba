% This script sets default fitting parameters for the E. coli model.
% Default values contained here are be overwritten by the wrapper function
% from which this script is called, depending on the specific configuration
% the wrapper script is being used to represent.


% The number of regualtions depends on whether we are using the 'unsplit'
% or 'split' parameterization methods. This is specified by the wrapper
% function which calls this script by pre-setting the field
% fitOptions.separateParams.
if exist('fitOptions','var') && isfield(fitOptions,'separateParams') && fitOptions.separateParams
    nRegs = 72;
else
    nRegs = 41;
end


% Default: Fit all parameters at once, one pass
fitOptions.fixedParameterSequence = zeros(nRegs,1);


% Model Specific: Weights for metabolites in fitness function. 18 elements
fitOptions.metaboliteWeights = ones(1,18);      % Default
fitOptions.fitFluxes = false;                   % Default
fitOptions.fbaObjective = 2;                    % Default
fitOptions.setEqualityEffluxes = false;         % Default


% These will be assigned by the wrapper functions
% % fitOptions.odeFile = [];
% % fitOptions.resultsDir = [];
fitOptions.seriesName = '';

% Set Fitting Parameters for R+

% Set other default parameters
fitOptions.nTFit = [];                          % Default
fitOptions.useNonzeroRegularization = true;     % Default
fitOptions.penaltyWeight = [];                  % Default
fitOptions.nTries = 1;                          % Default
fitOptions.nTriesPerturbation = 1e-2;           % Default
fitOptions.solverType = 'fminsearch';           % Assume LR+
fitOptions.fitScheme = 1;                       % Default

% Default: Show final solver output (For GA *or* fminsearch)
fitOptions.fitProgressDisplay = 'off'; % Options are: 'iter', 'final', 'off', and 'diagnose'

% Default solver options for if I'm using the GA
fitOptions.gaPopulationSize = 40;
fitOptions.gaGenerations = 400;
fitOptions.gaSecondaryOptimization = false;


% Bounds on [a,b] parameter search space   
% Default vaues
fitOptions.pLB = [zeros(nRegs,1),-inf(nRegs,1)];
fitOptions.pUB = [inf(nRegs,1), inf(nRegs,1)];

% Regs 1:3 are negative regulators
fitOptions.pLB(1:3,1) = -inf;
fitOptions.pUB(1:3,1) = 0;

% Regs 7:23 are fixed at known quantities from model
fitOptions.pLB(7:23,1) = 2.78e-05;
fitOptions.pUB(7:23,1) = 2.78e-05;
fitOptions.pLB(7:23,2) = 0;
fitOptions.pUB(7:23,2) = 0;

