OVERVIEW:
This archive contains supplementary files to the manuscript, "LK-DFBA: A Linear Programming-based mod- eling strategy for capturing dynamics and me- tabolite-dependent regulation in metabolism" by Robert Dromms, Justin Lee, and Mark Styczynski. The included code and data are those used to generate base ODE data, perform parameter fitting, and analyze model performance shown in Figures 2, 3, and 4 of the main manuscript. Updated versions of this code are hosted at https://github.com/gtStyLab/lk-dfba.

Additional file descriptions are contained within each subdirectory.





USER GUIDE:
The included directories contain pipelines for the two models described in the main text: the branch pathway model and the E. coli model.

The workflow in both cases is the same:
1) Generate Model Data
2) Perform Parameter fitting
3) Perform error analysis

To compress the size of this supplementary archive, we have removed some of the intermediate files from the following steps. However, all fitted parameters we produced are listed in the 'processedError_$_compact.mat' files in each of the '$analysis' directories, as well as the filename for the original fitted data, which also contained in the corresponding  '$analysis' directory.


For the branch pathway model, the results shown in the manuscript were produced by running the following scripts in sequence:
1) We ran 'branchModel/driver_genDatasets.m' to produce noiseless and noisy data sets
2) We copied the data directory 'branchModel/branchData' to 'branchCalculation'
3) We ran 'branchCalculation/driver_genBranchJobs_noisy.m' to generate the MATLAB script 'branchCalculation/driver_runJobs_matlab_noisy.m' (similarly, running 'branchCalculation/driver_genBranchJobs_hiRes.m' will generate 'branchCalculation/driver_runJobs_matlab_hiRes.m', corresponding to Figure S8 of the Supplementary Text)
4) We copied the directories 'branchModel/branchData' and 'branchCalculation/results' to 'branchAnalysis'
5) We performed fitting error analysis using 'branchAnalysis/driver_calculateError_noisy.m' to generate 'branchAnalysis/processedError_noisy_compact.mat' (similarly, we used 'branchAnalysis/driver_calculateError_missing.m' to generate  'branchAnalysis/processedError_missing_compact.mat' and  'branchAnalysis/driver_calculateError_hiRes.m' to generate  'branchAnalysis/processedError_hiRes_compact.mat')
Note: For the manuscript, we manually split 'branchAnalysis/results' into multiple results directories corresponding to the exact type of fit performed. The 'filename' field in the structures saved in 'branchAnalysis/processedError_hiRes_compact.mat', 'branchAnalysis/processedError_missing_compact.mat', and 'branchAnalysis/processedError_noisy_compact.mat' reflect this.
6) Figure 2 was generated using the script 'branchAnalysis/driver_genFigure2_plotError_noisy.m', and Figure 3 was generated using 'branchAnalysis/driver_genFigure3_plotError_missing.m'. (Similarly, Figure S8 was generated using 'branchAnalysis/driver_genFigureS8_plotError_hiRes.m' and Figure S11 was generated using 'driver_genFigureS11_plotParamVariance_LRp_noisy.m').


For the Chassagnole E. coli model, the results shown in the manuscript were produced by running the following scripts in sequence:
1) We simulated to ODE model as described in the manuscript using COPASI and the conditions saved in 'chassModel/chass2002_ishiiSettings.cps'.
2) We used the script 'chassModel/driver_convertChassDataToMat_variable.m' to convert 'chassModel/chass_copasiOutput_variableGlc.txt' to 'chassModel/generatedOutput/chassOdeV_hiRes.mat'.
3) We ran 'chassModel/driver_genNoisyDatasets.m' to produce noisy data sets from 'chassModel/generatedOutput/chassOdeV_hiRes.mat' and save them in 'chassModel/chassDataV'.
4) We copied the data directory 'chassModel/chassDataV' to 'chassCalculation'
5) We ran 'chassCalculation/driver_genChassFits_unsplit.m' and 'chassCalculation/driver_genChassFits_split.m' to generate 'chassCalculation/driver_runAllChassFits_matlab_unsplit.m' and 'chassCalculation/driver_runAllChassFits_matlab_split.m' respectively.
6) We ran 'chassCalculation/driver_runAllChassFits_matlab_unsplit.m' and 'chassCalculation/driver_runAllChassFits_matlab_split.m' to produce results directories 'chassCalculation/results_unsplit' and 'chassCalculation/results_split', respectively.
7) We copied the directories 'chassModel/chassDataV', 'chassCalculation/results_unsplit' and 'chassCalculation/results_split' to 'chassAnalysis'.
8) We performed fitting error analysis using 'chassAnalysis/driver_calculateError_chass.m' to generate 'chassAnalysis/processedError_chass_compact.mat'
9) Figure 4 was generated using the script 'chassAnalysis/driver_genFigure4_chassError.m'.





DIRECTORIES:

branchAnalysis:
Contains MATLAB scripts for analyzing the results of fitting the branched pathway model, including the scripts to generate Figures 2 and 3 of the manuscript.

branchCalculation:
Contains MATLAB scripts for performing parameter fitting on the branched pathway model data sets.

branchModel:
Contains documentation for the branched pathway model, as well as the MATLAB scripts used to generate noiseless and noisy data sets.

chassAnalysis:
Contains MATLAB scripts for analyzing the results of fitting the E. coli model, including the scripts to generate Figure 4 of the manuscript.

chassCalculation:
Contains MATLAB scripts for performing parameter fitting on the E. coli model data sets.

chassModel:
Contains documentation for the E. coli model, as well as the MATLAB scripts used to generate noiseless and noisy data sets.

libLKDFBA
Directory containing the main LK-DFBA code. This directory must be on the MATLAB path for the scripts in the other directories to function.
