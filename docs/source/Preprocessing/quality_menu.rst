image Quality
=============

Quality Assurance
^^^^^^^^^^^^^^^^^
Inspection of source images. Individual slices in an fMRI acquisition commonly suffer from random variations in average signal intensity, noise spikes, ghosts, and 
data glitches. These may result from physiological sources (patient motion, respiration, cardiac pulsations, anxiety, drowsiness, drugs) or from the scanner itself (field 
inhomogeneities, eddy currents, gradient heating, electronics). If unrecognized and included in the data analysis, these may spoil the entire experiment. A quick visual review of all 
source images together in montage mode is highly recommended to search for and exclude ("scrub") aberrant slices that appear too bright, too dark, or contain artifacts. More 
sophisticated graphical and semi-automated methods to identify outlier data are also available 3.

Distortion correction
^^^^^^^^^^^^^^^^^^^^^

Common fMRI/BOLD sequences acquire gradient echoes and hence are sensitive to magnetic inhomogeneity (T2*) effects. These cause spatial distortions and signal dropout especially near the skull base, 
typically affecting the anterior frontal and temporal lobes. Field mapping and "unwarping" methods (described in the Advanced Discussion) are available to reduce these distortions. Although these 
techniques may be required for sophisticated neuropsychological experiments, they are not commonly used for basic eloquent cortex mapping in clinical fMRI studies.

Slice timing correction
^^^^^^^^^^^^^^^^^^^^^^^

Most fMRI studies acquire one slice at a time, meaning that the signal recorded from one slice may be offset in time by up to several seconds when compared to another. The situation is even further 
complicated depending on whether the slices have been acquired in sequential (1,2,3,4,5,6...) or in interleaved (1,3,5,..2,4,6...) order and whether simultaneous multi-slice imaging has been employed.  
Although slice timing differences may not be important for simple block design experiments, they can impart considerable errors in rapid, event-related fMRI studies if not accounted for.

Two basic strategies have been developed for slice timing correction. Data shifting is the most commonly used method, where recorded points are moved to reflect their proper offset from the time of the 
stimulus. This method requires interpolation of points to fit the fixed, TR-based timing grid and thus produces some blurring and degradation of the data. An alternate (post-processing) strategy is model 
shifting, where the expected location of the hemodynamic response function (HRF) is varied, treating slice location as an additional independent variable in the subsequent statistical analysis. Sometimes 
temporal derivatives of the HRF are also incorporated in the model to improve accuracy.

Motion Correction
^^^^^^^^^^^^^^^^^

Head motion is the largest source of error in fMRI studies, and a variety of strategies have been developed to cope with this problem. Immobilization of the head using padding and straps is essential; 
even more rigid restrictions using bite bars and masks are occasionally employed. Proper coaching and training of the subject prior to imaging is important. Prospective motion correction using navigator 
echoes may be performed but more commonly motion correction is done retrospectively.

The standard retrospective motion correction method considers the head as a rigid body with three directions of translation (displacement) and three axes of rotation. A single functional volume of a run 
is chosen as the reference to which runs in all other volumes are aligned. An iterative procedure is performed in which each volume is rotated and aligned with the reference, with the goal to minimize a 
cost function (such as the mean-squared difference). This iterative adjustment terminates once no further improvement can be achieved. All major fMRI analysis packages produce line plots allowing visual 
inspection of how translation and rotation parameters change from volume to volume (see figure above).

Temporal Filtering
^^^^^^^^^^^^^^^^^^

fMRI data nearly always exhibit slow wandering of the baseline signal over time as well as rapid fluctuations due to noise. The removal of low frequency drifts is known as detrending. Detrending may be 
accomplished using either high-pass filtering after Fourier transformation or by time-domain averaging methods. Alternatively, gradual drifts can be removed later in the data analysis pipeline by adding 
a set of confound predictors (such as a discrete cosine transform basis set) to account for low-frequency fluctuations. High-frequency signal fluctuations (AKA "noise") can be removed by low-pass 
filtering. Low-pass filtering is generally not recommended for most studies, however, since it may distort estimation of individual HRFs and reduce the fMRI signals of interest.

Spatial Smoothing
^^^^^^^^^^^^^^^^^

Spatial smoothing is the averaging of signals from adjacent voxels. This improves the signal-to-noise ratio (SNR) but decreases spatial resolution, blurs the image, and smears activated areas into 
adjacent voxels. The process can be justified because closely neighboring brain voxels are usually inherently correlated in their function and blood supply. The standard method is to convolve 
("multiply") the fMRI data with a 3D Gaussian kernel ("filter") that averages signals from neighboring voxels with weights that decrease with increasing distance from the target voxel. The optimal kernel 
size is disputed, depending on factors such as slice thickness and in-plane resolution and the need for spatial separation of small activation regions. In practice, the full width half maximum (FWHM) 
value of the Gaussian spatial filter is typically set to about 4-6 mm for single subject studies and to about 6-8 mm for multi-subject analyses.
