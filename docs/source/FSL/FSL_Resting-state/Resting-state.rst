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

Structural images for use as "highres" images in registration should normally be brain-extracted using BET.

Data
****
