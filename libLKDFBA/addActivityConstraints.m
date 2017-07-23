function modelStruct = addActivityConstraints(modelStruct)
% Uses the stoichiometric matrix to identify the "effluxes" from each
% metabolite, and adds a constraint representing the availability of the
% metabolite to act as substrate for . These are added to the parameters
% and constraints as additional regulatory interactions.
%
% Written 2016-01-19 by R.A.Dromms
% Edited 2016-10-25 by R.A.Dromms
%       Streamlined to only update FBA model
    
    % Get some info from the model
    S = modelStruct.S;
    numMetabs = size(S,1);
    numOrigRegs = size(modelStruct.kineticsMap,1);
    
    % Pre-allocate, assuming we're adding one rule per metabolite
    if isfield(modelStruct,'separateParams') && modelStruct.separateParams
        regSet = cell(numOrigRegs+nnz(S),3);
    else
        regSet = cell(numOrigRegs+numMetabs,3);
    end
    
    % Throw the old regs list in the *first slots*
    if ~isempty(modelStruct.kineticsMap)
        if size(modelStruct.kineticsMap,2) == 3
            regSet(1:numOrigRegs,:) = modelStruct.kineticsMap;
        else
            regSet(1:numOrigRegs,1:2) = modelStruct.kineticsMap;
            regSet(1:numOrigRegs,3) = {'<'};
        end
    end
    
    
    % For the remaining rows in regSet,
    k = numOrigRegs+1;
    
    if isfield(modelStruct,'separateParams') && modelStruct.separateParams
        % S will give us a set of "effluxes" that "leave" each metabolite.
        % We need to add a regulatory rule for each effluxes.
        for i = 1:numMetabs;
            effluxList = find(S(i,:)<0);
            for j = effluxList;
                % Let's add a check to make sure the particular combination
                % doesn't already exist
                addConstraint = true;
                
                % Loop through existing regs and make sure we aren't
                % about to duplicate something we already have
                for k_i = 1:size([regSet{:,1}]',1)
                    % Note: controller and target match must be EXACT
                    % This only happens with single targetsingle controller
                    % cases, so it won't preclude cases like,
                    %     x1 --> [V1 V2] AND x1 --> v1
                    if ~isempty(regSet{k_i,1}) && regSet{k_i,1} == i && regSet{k_i,2} == j
                        addConstraint = false;
                    end
                end
                
                if addConstraint
                    regSet{k,1} = i;
                    regSet{k,2} = j;
                    % RAD 2017-02-27: Let's see if we can better capture the
                    % right behavior if we set constraints on effluxes to be
                    % '=' instead of '<' to force metabolite accumulation and
                    % flux at these values, instead of hoping that the right
                    % objective function will fix it.
                    if isfield(modelStruct,'equalityEffluxList')
                        if any(j==modelStruct.equalityEffluxList)
                            regSet{k,3} = '=';
                        else
                            regSet{k,3} = '<';
                        end
                    else
                        regSet{k,3} = '<';
                    end
                    k=k+1;
                end
            end
        end
    else
        % S will give us a set of "effluxes" that "leave" each metabolite.
        % We need to add a regulatory rule capping the sum of these effluxes.
        for i = 1:numMetabs;
            effluxList = find(S(i,:)<0);
            if ~isempty(effluxList)
               regSet{k,1} = i;
               regSet{k,2} = effluxList;
               regSet{k,3} = '<';
               k=k+1;
            end
        end
    end

    % If we didn't assign constraints for all metabolites, then get rid of
    % the extra stuff we allocated
    regSet(k:end,:) = [];
    
    % In addition: Remove regulators that correspond to fixed flux values
    fixedFluxes = find(modelStruct.vBounds(:,1) == modelStruct.vBounds(:,2));
    for k = 1:length(fixedFluxes)
        for i = size(regSet,1):-1:1
            if all(regSet{i,2} == fixedFluxes(k))
                regSet(i,:) = [];
            end
        end
    end
    
    % Pass out the final regulation set
    modelStruct.kineticsMap = regSet;
    
end
