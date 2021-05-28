Longitudinal processing 
^^^^^^^^^^^^^^^^^^^^^^^ 

All data for this tutorial has already been processed for you since processing can take up to 24h. However, to continue you need to understand the three processing steps (cross, base, long) and 
associated directory names.

assume you have a subject with two time points: time_point_1 and time_point_2

[CROSS]: You would process these two imagesindependently first (we call that cross as in crossectional analysis/processing) using the regular FreeSurfer processing stream (recon-all). You end up with two 
directories with the names OAS2_0001_MR1 and OAS2_0001_MR2 

[BASE]: Then you would run the second step to create the within subject template (also called base) and end up with a new directory. There is only one base directory per subject. We decide to name the 
base: OAS2_0001. Inside this directory are the results for the average anatomy of your subject across time. You don't use this data in any analysis, and only look at it for quality checking or editing.  

[LONG]: Finally you would create the two longitudinal runs (the ones you are actually interested in). You end up with two more directories (these names get automatically assigned): 
OAS2_0001_MR1.long.OAS2_0001 and OAS2_0001_MR2.long.OAS2_0001. They contain the final, most reliable and accurate processing results..
