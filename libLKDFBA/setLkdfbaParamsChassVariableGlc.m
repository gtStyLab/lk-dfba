% MATLAB script used to set default LK-DFBA run parameters for the E. coli
% model, assuming that extracellular glucose is allowed to vary from its
% initial concentration. Contrast with the model configuration when
% extracellular glucose is fixed, as shown in the similar script
% 'setLkdfbaParamsChassFixedGlc.m'.

% Max value for otherwise unconstrained internal fluxes
boundMax = 100;

% % fbaStruct.setIrreversible = true; % True is default behavior
modelStruct.solverScheme = 0;
modelStruct.nTBufferFraction = 0.25;
modelStruct.objectiveType = 'instant';
modelStruct.l2Weight = 1e-3;
modelStruct.minNt = 100;


% Additional Model Specifications
rGlucoseIntake = 0.003043342; % 'Extracellular glucose kinetics' Glucose source flux (fixed)
rMaxMurSynth = 0.00043711; % From Chassagnole SBML model file
rMaxTrpSynth = 0.001037; % From Chassagnole SBML model file
rMaxMetSynth = 0.0022627; % From Chassagnole SBML model file


% % % % % % % % % % Build the basic FBA model % % % % % % % % % % % % % % %

% First, load in the Chassagnole model information
load('chassSTM.mat')
if exist('fitOptions','var') && isfield(fitOptions,'odeFile')
    load(fitOptions.odeFile,'concNames','fluxNames','concMatrix');
else
    load('chassODE_medResShort.mat','concNames','fluxNames','concMatrix');
end

% Option: do we want to set equality constraints on efflux fluxes?
if exist('fitOptions','var') && isfield(fitOptions,'setEqualityEffluxes') && fitOptions.setEqualityEffluxes
    modelStruct.equalityEffluxList = [15, 17, 21, 22, 23, 25, 30, 31];    
end

modelStruct.S = sparse(stm);
clear('stm')

% Save the concentration and flux names to our FBA structure
modelStruct.concNames = concNames;
modelStruct.fluxNames = fluxNames;


% Regulation Info: Each row is one regulatory constraint
% First column: Indices for Controller Metabolites 
% Second column: Indices for Target Fluxes
% Third column: Constraint 'sense' string, either '<' or '='

modelStruct.kineticsMap = {% First: 'Allosteric' regulation
                            2,  2, '<'; % g6p inhibits PTS
                           12,  3, '<'; % 6pg inhibits PGI
                           10,  6, '<'; % pep inhibits PFK
                            4, 20, '<'; % fdp promotes PK
                            4, 21, '<'; % fdp promotes PEPCxylase
                            4, 31, '<'; % fdp promotes G1PAT
                           % Second: Degradation terms
                            2, 32, '='; % g6p promotes "G6P degradation"
                            3, 33, '='; % f6p promotes "F6P degradation"
                            4, 34, '='; % fdp promotes "FDP degradation"
                            5, 35, '='; % gap promotes "GAP degradation"
                            6, 36, '='; % dhap promotes "DHAP degradation"
                            7, 37, '='; % pgp promotes "PGP degradation"
                            8, 38, '='; % 3pg promotes "PG3 degradation"
                            9, 39, '='; % 2pg promotes "PG2 degradation"
                           10, 40, '='; % pep promotes "PEP degradation"
                           11, 41, '='; % pyr promotes "Pyruvate dilution"
                           12, 42, '='; % 6pg promotes "PG dilution"
                           13, 43, '='; % ribu5p promotes "Ribu5P dilution"
                           14, 44, '='; % xyl5p promotes "XYL5P dilution"
                           15, 45, '='; % sed7p promotes "SED7P dilution"
                           16, 46, '='; % rib5p promotes "Rib5P dilution"
                           17, 47, '='; % e4p promotes "E4P dilution"
                           18, 48, '='; % g1p promotes "GLP dilution"
                           % Third: 'Mass Action' terms, to be added after 
                           };


% Define concentration bounds on the model; default is 0 to inf
modelStruct.xBounds = [        0,       inf; % "Extracellular Glucose"
                             0,       inf; % Glucose-6-Phosphate
                             0,       inf; % Fructose-6-Phosphate
                             0,       inf; % Fructose-1,6-bisphosphate
                             0,       inf; % Glyceraldehyde-3-Phosphate
                             0,       inf; % Dihydroxyacetonephosphate
                             0,       inf; % 1,3-diphosphosphoglycerate
                             0,       inf; % 3-Phosphoglycerate
                             0,       inf; % 2-Phosphoglycerate
                             0,       inf; % "Phosphoenol pyruvate"
                             0,       inf; % Pyruvate
                             0,       inf; % 6-Phosphogluconate
                             0,       inf; % Ribulose-5-phosphate
                             0,       inf; % Xylulose-5-phosphate
                             0,       inf; % sedoheptulose-7-phosphate
                             0,       inf; % Ribose-5-phosphate
                             0,       inf; % Erythrose-4-phosphate
                             0,       inf; % Glucose-1-Phosphate
                     ];
clear('glcExt_x0','concMatrix')

% Define flux bounds on the original model;  LB = -inf --> reversible
modelStruct.vBounds = [
    rGlucoseIntake, rGlucoseIntake; %glc_kin
                            0, inf; %PTS
                         -inf, inf; %PGI
                         -inf, inf; %PGM
                            0, inf; %G6PDH
                            0, inf; %PFK
                         -inf, inf; %TA
                         -inf, inf; %TKa
                         -inf, inf; %TKb
        rMaxMurSynth, rMaxMurSynth; %MurSynth
                         -inf, inf; %ALDO
                         -inf, inf; %GAPDH
                         -inf, inf; %TIS
        rMaxTrpSynth, rMaxTrpSynth; %TrpSynth
                            0, inf; %G3PDH
                         -inf, inf; %PGK
                            0, inf; %SerSynth
                         -inf, inf; %PGluMu
                         -inf, inf; %ENO
                            0, inf; %PK
                            0, inf; %PEPCxylase
                            0, inf; %Synth1
                            0, inf; %Synth2
                            0, inf; %DAHPS
                            0, inf; %PDH
        rMaxMetSynth, rMaxMetSynth; %MetSynth
                            0, inf; %PGDH
                         -inf, inf; %R5PI
                         -inf, inf; %Ru5p
                            0, inf; %RPPK
                            0, inf; %G1PAT
                            0, inf; %g6p_deg
                            0, inf; %f6p_deg
                            0, inf; %fdp_deg
                            0, inf; %gap_deg
                            0, inf; %dhap_deg
                            0, inf; %pgp_deg
                            0, inf; %pg3_deg
                            0, inf; %pg2_deg
                            0, inf; %pep_deg
                            0, inf; %pyr_dil
                            0, inf; %pg_dil
                            0, inf; %ribu5p_dil
                            0, inf; %xyl5p_dil
                            0, inf; %sed7p_dil
                            0, inf; %rib5p_dil
                            0, inf; %e4p_dil
                            0, inf; %g1p_dil
                     ];
                 

% Now we're going to convert these bounds to finite values
modelStruct.vBounds(isinf(modelStruct.vBounds)) = boundMax*sign(modelStruct.vBounds(isinf(modelStruct.vBounds)));

% % % % Convert the FBA model to the reversible version % % % % % % % % % %
% I added in an option to let us skip taking this step, if we want...
if ~exist('fitOptions','var') || ~isfield(fitOptions,'setIrreversible') || isempty(fitOptions.setIrreversible) || ~fitOptions.setIrreversible
    % We need to split reversible reactions into 2x non-reversible
    modelStruct = convertModelIrrev(modelStruct);
else
    % We need to limit reversible reactions to forward direction
    modelStruct.vBounds(modelStruct.vBounds(:,1)<0,1) = 0;
end

% Then, let's add "Activity Constraints"
modelStruct = addActivityConstraints(modelStruct);


% objectiveFluxIndex is for instant objective function
modelStruct.objectiveFluxIndex = 25; % Default
% % modelStruct.objectiveFluxIndex = [15, 17, 21, 22, 23, 25, 30, 31]; % ALternative

% objectiveMetaboliteIndex is for terminal objective for pooling objective
modelStruct.objectiveMetaboliteIndex = [];


