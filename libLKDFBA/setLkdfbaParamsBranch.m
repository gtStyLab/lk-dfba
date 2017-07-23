% MATLAB script used to set default LK-DFBA run parameters for the branched
% pathway model.

% This sets a buffer on the simulated time course by adding some fraction
% of the overall interval to the end of the interval, in case there is an
% issue with an off-loading effect. The default value of 0.3 will add a
% very conservative 30 buffer to the interval [tStart tEnd] when solving
% the LK-DFBA QP, which is truncated from the solution time course when it
% is reported by calcLKDFBA().
modelStruct.nTBufferFraction = 0.3;

% See supplemental text for 'instant' vs 'terminal' discussion. Default
% value is 'instant', and omitting this specification assumes 'instant'.
modelStruct.objectiveType = 'instant';

% Weight on the L2 penalty on QP term of the objective function.
modelStruct.l2Weight = 1e-2;

% Specifies a lower bound on nT, to prevent calls during fitting where nT
% is too low to guarantee sufficient accuracy in the integration equations.
% This can occur when the data to be fit is low resolution and the default
% value for fitting is based on the data.
modelStruct.minNt = 100;


% System stoichiometric matrix, directly from standard FBA.
modelStruct.S = sparse([ 1 -1  0 -1  0   ;
                       0  1 -1  0  0   ;
                       0  0  1  0 -0.6 ;
                       0  0  0  1 -0.4 ;
                       0  0  0  0  1   ]);
                   
                   
% Lower and upper bounds (columns) on system metabolites (rows).
modelStruct.xBounds = [0,inf;
                       0,inf;
                       0,inf;
                       0,inf;
                       0,inf;
                       ];
     
% Lower and upper bounds (columns) on system fluxes (rows).
modelStruct.vBounds = [1,1;
                       0,inf;
                       0,inf;
                       0,inf;
                       0,inf;
                       ];
       
% This specifies linear kinetics. Absense of third cell array column
% indicates all mappings are '<' by default; see
% 'setLkdfbaParamsChassVariableGlc.m' for an example of a mixed assignment
% of '<' and '=' cases.
modelStruct.kineticsMap = {1,[2,4];
                           2,[3];
                           3,[5];
                           4,[5];
                           3,[4];
                           4,[3];
                           };

