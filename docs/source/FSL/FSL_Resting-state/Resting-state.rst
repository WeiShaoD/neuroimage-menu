Resting-state analysis
======================

MELODIC ( Multivariate Exploratory Linear Optimized Decomposition into Independent Components ) is a 3 Independent Component Analysis to decompose a single 
or multiple 4D data sets into different spatial and temporal components. In Fsl, MELODIC uses either Tensorial Independent Component Analysis (TICA, where 
data is decomposed into spatial maps, time courses and subject/session modes) or a simpler temporal concatenation approach. MELODIC can pick out different 
activation and artefactual components without any explicit time series model being specified.

Melodic GUI
^^^^^^^^^^^

In order to open the MELODIC GUI, either type Melodic in a terminal, or Open fsl and press the MELODIC button.It is worth ot note that before we start the 
analysis, you need to prepare the data as a 4D NIFTI or Analyze format image; you can use the fslmerge or fslsplit to convert between multiple 3D images and 
a single 4D (3D+time) image.


Data box
********

First of all, pressing ``Select 4D data`` set the filename of the 4D input image. You can select multiple files if you want MELODIC to perform a group 
analysis or if you can run separate ICAs with the same setup. Results for each input file will be saved in separate .ica directories, the name of which is 
based on the input data's filename unless you enter an Output directory name.

``Delete volumes`` controls the number of initial fMRI volumes to delete before any further processing.

``TR`` controls the time (in seconds) between scanning successive FMRI volumes.

``High pass filter cutoff`` controls the longest temporal period that you will allow.

Pre-Stats
*********

Since Low-frequency drifts and motion in the data will affect the decomposition. We would want to motion-correct the data, remove these drifts first or 
perform other types of typical data pre-processing before running the analysis.

Registration
************

Before any multi-session or multi-subject analyses can be carried out, the different sessions need to be registered to each other. This is made easy within 
MELODIC which performs registration on input data as part of an analysis using FEAT functionality. Unlike registration step in FEAT this here needs to be 
performed before the statistical analysis so that the filtered functional data is transformed into the standard space. 

**Standard space** refers to the standard (reference) image, ideally with the non-brain structures already removed.

**Resampling resolution (mm)** refers to the desired isotropic voxel dimension of the resampled data. In order to save on disk space and on required memory 
during the analysis it is advisable to resample the filtered data into standard space but keeping the resampled resolution at the FMRI resolution (typically 
4mm or 5mm).

Stats
*****

The **Stats section** lets you control some of the options for the decomposition. The default setting will most probably already be set to what you would 
want most of the time.

By default, Melodic will automatically estimate the number of components from the data - you can switch this option off and then can specify the number of 
components explicitly.

Post-Stats
**********

Melodic will also by default carry out inference on the estimated maps using a mixture model and an alternative hypothesis testing approach. A threshold 
level of 0.5 in the case of alternative hypothesis testing means that a voxel 'survives' thresholding as soon as the probability of being in the 'active' 
class (as modelled by the Gamma densities) exceeds the probability of being in the 'background' noise class. This threshold level assumes that you are 
placing an equal loss on false-positives and false-negatives. If, however, you consider e.g. false-positives as being twice as bad as false-negatives you 
should change this value to 0.66...

MELODIC result
**************


