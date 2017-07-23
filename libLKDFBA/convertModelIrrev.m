function [fbaStruct] = convertModelIrrev(fbaStruct)
% Takes an FBA model and converts reversible reactions to a pair of
% irreversible reactions.
%
% Written 2016-01-19 by R.A.Dromms
    
    rxnIndexList = find(fbaStruct.vBounds(:,1) < 0);
    numOrigRxns = size(fbaStruct.S,2);
    numNewRxns = numOrigRxns + length(rxnIndexList);
    
    S2 = spalloc(size(fbaStruct.S,1),numNewRxns,nnz(fbaStruct.S)+nnz(fbaStruct.S(:,rxnIndexList)));
    S2(:,1:numOrigRxns) = fbaStruct.S;
    
    vBounds2 = zeros(numNewRxns, 2);
    vBounds2(1:numOrigRxns,:) = fbaStruct.vBounds;
    
    if isfield(fbaStruct,'fluxNames')
        fluxNames2 = cell(numNewRxns,1);
        fluxNames2(1:numOrigRxns) = fbaStruct.fluxNames;
    end
    
    for i = 1:length(rxnIndexList)
        % What is the LB?
        lb = fbaStruct.vBounds(rxnIndexList(i),1);
        
        % We want to add a new reaction representing -v(i)
        S2(:,numOrigRxns+i) = -fbaStruct.S(:,rxnIndexList(i));
        vBounds2(numOrigRxns+i,:) = [0, -lb];
        
        % Make original rxn irrev
        vBounds2(rxnIndexList(i),1) = 0;
        
        % If we have flux names available, modify them accordingly
        if isfield(fbaStruct,'fluxNames')
            rxnName = fbaStruct.fluxNames{rxnIndexList(i)};
            fluxNames2{rxnIndexList(i)} = sprintf('%s: forward',rxnName);
            fluxNames2{numOrigRxns+i} = sprintf('%s: reverse',rxnName);
        end
        
    end
    
    % Pass our work back out
    fbaStruct.S = S2;
    fbaStruct.vBounds = vBounds2;
    if isfield(fbaStruct,'fluxNames')
        fbaStruct.fluxNames = fluxNames2;
    end
    
end
