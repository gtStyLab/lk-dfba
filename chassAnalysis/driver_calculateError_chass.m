clc; clear; close all

errorFileName = 'processedError_chass.mat';
refDataName = 'chassV_hiRes.mat';
dataDir = 'chassDataV';
nTErrorCalc = 200;


resultsDirectoryList =  {
                        'chassDataV';
                        'results_unsplit';
                        'results_split';
                        };


fileNameList = [];

for dirName = resultsDirectoryList';

    fileSubsetList = dir(dirName{1});
    fileSubsetList = {fileSubsetList(:).name}';
    for k = length(fileSubsetList):-1:1
        if strcmp(fileSubsetList{k}(1),'.')
            fileSubsetList(k) = [];
        else
            fileSubsetList{k} = sprintf('%s/%s',dirName{1},fileSubsetList{k});
        end
    end

    fileNameList = [fileNameList; fileSubsetList];
end


excludeList = {
               '';
               };


tabulatedCalc = struct('fileName',fileNameList,'trainingDataName',[],'referenceData',[],'parameters',[],'totalError',nan);

refData = load(refDataName);

load('chassFbaStm.mat','stm')
refData.STM = stm;

% Add terms for reversible reactions
refData = splitOdeDataReversible(refData);
numSysFluxes = size(refData.fluxMatrix,2);

% Add terms for pooling fluxes: leave as NaN for now?
numPoolingFluxes = size(refData.concMatrix,2);
refData.fluxMatrix(:,end+1:end+numPoolingFluxes) = nan;


% Scaling factors for balancing error terms:
concRanges = range(refData.concMatrix,1);
concRanges(concRanges==0) = NaN;
fluxRanges = range(refData.fluxMatrix,1);
fluxRanges(fluxRanges==0) = NaN;


totalTic = tic;

for k = 1:length(fileNameList)
    
    fileName = fileNameList{k};
    innerTic = tic;

    fprintf('Processing k = %5d\n\t%s\n',k,fileName);

    if exist(fileName,'file')
   
        % Load in data files
        data = load(fileName);
        
        if isfield(data,'optimalParams')
            tabulatedCalc(k).parameters = data.optimalParams;
        elseif isfield(data,'paramsVec')
            tabulatedCalc(k).parameters = data.paramsVec;
        end
        
        if ~isfield(data,'nTFit') && isfield(data,'fitOptions')
            idxList = strfind(fileName,'nT-');
            data.nTFit = str2double(fileName(idxList(end)+3:idxList(end)+5));
        end
        
        if isfield(data,'odeFile')
            idxList = strfind(data.odeFile,'/');
            tabulatedCalc(k).trainingDataName = sprintf('%s',data.odeFile(idxList(end)+1:end));
        else
            idxList1 = strfind(fileName,'/');
            idxList2 = strfind(fileName,'rep-');
            tabulatedCalc(k).trainingDataName = sprintf('%s.mat',fileName(idxList1(end)+1:idxList2+6));
        end
        
        tabulatedCalc(k).referenceData = refDataName;     
        errorCheck = false;
        
        if ~any(strcmp(fileName,excludeList))
            
            odeTimeVec = linspace(refData.tStart,refData.tEnd,nTErrorCalc+1);
            odeConcMatrix = interp1(refData.timeVec,refData.concMatrix,odeTimeVec,'linear','extrap');

        
            if ~isempty(strfind(fileName,'fbaRegressionPlusParams')) || ~isempty(strfind(fileName,'fbaRegressionParams')) || ~isempty(strfind(fileName,'fbaGaParams'))

                ntSim = nTErrorCalc;
                errorCheck = true;

                while ntSim > 49 && errorCheck

                    % Simulate FBA
                    [modelTimeVec,modelConcMatrix,modelFluxMatrix,status] = calcLKDFBA(odeTimeVec(1),odeTimeVec(end),ntSim,odeConcMatrix(1,:),data.modelStruct.S,data.modelStruct.xBounds,data.modelStruct.vBounds,data.modelStruct.kineticsMap,data.optimalParams,data.modelStruct);

                    if ~strcmp('OPTIMAL',status.status) || any(isnan(modelConcMatrix(:))) || any(isnan(modelFluxMatrix(:))) || isempty(modelConcMatrix) || isempty(modelFluxMatrix)
                        fprintf('\t\t%s at nT = %d\n',status.status, ntSim)
                        errorCheck = true;
                        ntSim = floor(0.99 * ntSim);
                    else
                        errorCheck = false;
                    end
                end

                if ~errorCheck
                    numFittedParams = nnz(data.fitOptions.pLB(:) ~= data.fitOptions.pUB(:)); 
                    modelFluxTimeVec = modelTimeVec(1:end-1)+0.5*diff(modelTimeVec(1:2));
                    odeFluxTimeVec = modelFluxTimeVec;
                    odeFluxMatrix = interp1(refData.fluxTimeVec,refData.fluxMatrix,odeFluxTimeVec,'linear','extrap');
                end


            elseif ~isempty(strfind(fileName,'BstParams'))

                odeFluxTimeVec = odeTimeVec;
                odeFluxMatrix = interp1(refData.fluxTimeVec,refData.fluxMatrix,odeFluxTimeVec,'linear','extrap');

                optimalParams = [refData.paramsVec(1:2,1);data.optimalParams];
                [modelTimeVec,modelConcMatrix,modelFluxMatrix] = solveOdeBstBranch(odeTimeVec(1),odeTimeVec(end),nTErrorCalc,odeConcMatrix(1,:),optimalParams);
                modelFluxTimeVec = modelTimeVec;

                if isempty(modelConcMatrix)
                    errorCheck = true;
                end


            elseif ~isempty(strfind(fileName,dataDir))

                odeTimeVec = data.timeVec;
                odeFluxTimeVec = data.timeVec;

                odeConcMatrix = interp1(refData.timeVec,refData.concMatrix,odeTimeVec,'linear','extrap');
                odeFluxMatrix = interp1(refData.fluxTimeVec,refData.fluxMatrix,odeFluxTimeVec,'linear','extrap');

                numFittedParams = 0;
                data.nTFit = 1;

                data.STM = stm;
                data = splitOdeDataReversible(data);
                data.fluxMatrix(:,end+1:end+numPoolingFluxes) = nan;
                
                data.fitnessWeightVector = 1;
                modelTimeVec = data.timeVec;
                modelFluxTimeVec = data.timeVec;
                modelConcMatrix = data.concMatrix;
                modelFluxMatrix = data.fluxMatrix;
                
                
                

                if isempty(modelConcMatrix)
                    errorCheck = true;
                end

            else
                fprintf('Error Processing %s\n',fileName);
            end

            if ~errorCheck

                if length(modelTimeVec) < length(odeTimeVec)
                    n1 = length(modelTimeVec);
                    n2 = length(odeTimeVec);
                    modelConcMatrix(n1+1:n2,:) = repmat(modelConcMatrix(n1,:),(n2-n1),1);
                end
                if length(modelFluxTimeVec) < length(odeFluxTimeVec)
                    n1 = length(modelFluxTimeVec);
                    n2 = length(odeFluxTimeVec);
                    modelFluxMatrix(n1+1:n2,:) = repmat(modelFluxMatrix(n1,:),(n2-n1),1);
                end

                % Calculate error and/or BIC
                try
                concErrorMatrix = (odeConcMatrix-modelConcMatrix);
                fluxErrorMatrix = (odeFluxMatrix-modelFluxMatrix);
                catch
                   beep 
                end

                % Add the values to the record
                tabulatedCalc(k).concResiduals = concErrorMatrix;
                tabulatedCalc(k).fluxResiduals = fluxErrorMatrix;


                % Let's assume: L2 error, scaled down by # of timepoints
                concErrorVec = nansum(concErrorMatrix.^2,1)/size(concErrorMatrix,1);
                fluxErrorVec = nansum(fluxErrorMatrix.^2,1)/size(fluxErrorMatrix,1);

                % Add the values to the record
                tabulatedCalc(k).concErrorVec = concErrorVec;
                tabulatedCalc(k).fluxErrorVec = fluxErrorVec;


                % Tab up error terms, divide each part by range scale
                concError = nansum(concErrorVec./concRanges);
                sysFluxError = nansum(fluxErrorVec(1:numSysFluxes)./fluxRanges(1:numSysFluxes));
                poolFluxError = nansum(fluxErrorVec(numSysFluxes:numSysFluxes+numPoolingFluxes)./fluxRanges(numSysFluxes:numSysFluxes+numPoolingFluxes));

                % Add the values to the record
                tabulatedCalc(k).concError = concError;
                tabulatedCalc(k).sysFluxError = sysFluxError;
                tabulatedCalc(k).poolFluxError = poolFluxError;

                % Let's assume: using denominator adjusted for parameter number
                nTotal = data.nTFit * nnz(data.fitnessWeightVector);
                tabulatedCalc(k).adjustedDenominator = (nTotal - numFittedParams)/nTotal;

                % Let's assume: lump total error 1:1 between conc, flux
    % %             totalError = concError + sysFluxError + poolFluxError;
                totalError = concError + sysFluxError;
% %                 totalError = concError;

                tabulatedCalc(k).concError = concError;
                tabulatedCalc(k).adjConcError = concError/tabulatedCalc(k).adjustedDenominator;
                
                tabulatedCalc(k).sysFluxError = sysFluxError;
                tabulatedCalc(k).adjSysFluxError = sysFluxError/tabulatedCalc(k).adjustedDenominator;
                
                tabulatedCalc(k).totalError = totalError;
                tabulatedCalc(k).adjTotalError = totalError/tabulatedCalc(k).adjustedDenominator;
                

                fprintf('\t  Conc Error:\t   %6.6f\n',tabulatedCalc(k).concError)
                fprintf('\t  Adj Conc Error: %6.6f\n',tabulatedCalc(k).adjConcError)

                fprintf('\t  Total Error:\t   %6.6f\n',tabulatedCalc(k).totalError)
                fprintf('\t  Adj Total Error: %6.6f\n',tabulatedCalc(k).adjTotalError)

            end
            
        else
            fprintf('File omitted from analysis\n');
        end
        
        fprintf('\tTime: %f sec\n',toc(innerTic));
    else
        fprintf('File "%s" not found \n',fileName);
    end
end

fprintf('\n\nTotal Time: %f sec\n',toc(totalTic));
save(errorFileName,'tabulatedCalc')

tabulatedCalc = rmfield(tabulatedCalc,{'trainingDataName','referenceData','concResiduals','fluxResiduals','concErrorVec','fluxErrorVec'});
save(sprintf('%s_compact.mat',errorFileName(1:end-4)),'tabulatedCalc');


