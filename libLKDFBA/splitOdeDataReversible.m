function odeData = splitOdeDataReversible(odeData)
% Splits the reversible fluxes in odeData into two irresversible flux
% reactions. This is accoplished by assigning the positive flux values to
% the forward flux and the negative flux values to the reverse flux. This
% is a crude assumption, but the most parsimonious one without additional
% data to more accurately model the forward and reverse fluxes (which would
% need to sum up to the same value at each time point).
%
% Written by R.A.Dromms, 2017-02-17

    % 1. Collect a list of reversed reactions in the STM
    % We only need to look over the range in fluxMatrix
    % Anything beyond that is biomass or a reversed reaction
    % This lets us avoid double counting. Makes things easy.
    odeMaxFlux = size(odeData.fluxMatrix,2);
    stmMaxFlux = size(odeData.STM,2);
    reverseIdx = cell(odeMaxFlux,1);
    
    for j = 1:size(odeData.fluxMatrix,2)
        % Are any of the fluxes (outside the ODE flux data) just a negation of this flux's stoichiometry?
        reverseIdx{j} = odeMaxFlux + find(all(repmat(odeData.STM(:,j),1,stmMaxFlux-odeMaxFlux) == -odeData.STM(:,odeMaxFlux+1:stmMaxFlux)));
    end
    
    % 2. Use this list to assign positive the flux values to the forward
    % reaction and the negative values to the reverse reaction
    for j = 1:length(reverseIdx)
        
        if ~isempty(reverseIdx{j})
            % Default values are zeros (for now)
            positiveValues = zeros(size(odeData.fluxMatrix,1),1);
            negativeValues = zeros(size(odeData.fluxMatrix,1),1);

            % Split the data into positive and negative values
            positiveValues(odeData.fluxMatrix(:,j)>0) = odeData.fluxMatrix(odeData.fluxMatrix(:,j)>0,j);
            negativeValues(odeData.fluxMatrix(:,j)<0) = odeData.fluxMatrix(odeData.fluxMatrix(:,j)<0,j);
            
            % Assign the split values to the forward and reverse fluxes
            odeData.fluxMatrix(:,j) = positiveValues;
            odeData.fluxMatrix(:,reverseIdx{j}) = -negativeValues;
            
            % Update the fluxNames field
            fluxName = odeData.fluxNames{j};
            odeData.fluxNames{j} = sprintf('%s: forward',fluxName);
            odeData.fluxNames{reverseIdx{j}} = sprintf('%s: reverse',fluxName);
        end
    end

    % Note that we may still need to add e.g. biomass fluxes after this.
    % Those steps are model-specific and are outside this function's scope.
end
