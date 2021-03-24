Image quality and preprocessing
==============

A good cuisine requires dedicated processes to make the ingredient to be prepared well for the following cooking. There many different preprocessing for neuroimage analysis, but in general, there are 6 
major steps are required for the most software packages

1 Inspect the image quality
^^^^^^^^^^^^^^^^^^^^^^^^^

Individual slices in an fMRI acquisition commonly suffer from random variations in average signal intensity, noise spikes, ghosts, and data glitches. These may result from physiological sources 
(participant motion, respiration, cardiac pulsations, anxiety, drowsiness, drugs) or from the scanner itself (field inhomogeneities, eddy currents, gradient heating, electronics). If unrecognized and 
included in the data analysis, these may spoil the entire experiment. A quick visual review of all source images together in montage mode is highly recommended to search for and exclude ("scrub") 
aberrant slices that appear too bright, too dark, or contain artifacts. More sophisticated graphical and semi-automated methods to identify outlier data are also available. Each of these slices takes 
tens to hundreds of milliseconds.The two most commonly used methods for creating volumes are sequential and interleaved slice acquisition.Sequential slice acquisition acquires each adjacent slice 
consecutively, either bottom-to-top or top-to-bottom. Interleaved slice acquisition acquires every other slice, and then fills in the gaps on the second pass. Both of these methods are illustrated in the 
video below.

.. image:: Preprocessing_check.PNG


2 Slice correction
^^^^^^^^^^^^^^^^^^

Most fMRI studies acquire one slice at a time, meaning that the signal recorded from one slice may be offset in time by up to several seconds when compared to another. Each of these slices takes tens to 
hundreds of milliseconds.The two most commonly used methods for creating volumes are sequential and interleaved slice acquisition. sequential acquisition slices have been acquired in sequential 
(1,2,3,4,5,6...), Interleaved slice acquisition (1,3,5,..2,4,6...) acquires every other slice and then fills in the gaps on the second pass o.  Although slice timing differences may not be important for 
simple block design experiments, they can impart considerable errors in rapid, event-related fMRI studies if not accounted for. Although slice timing differences may not be important for simple block 
design experiments, they can impart considerable errors in rapid, event-related fMRI studies if not accounted for.

.. figure:: SliceTimingCorrection_Demo.gif

   figure created by Andrew Jahn

In order to make statistics model work, the time-series for each slice needs to be shifted back in time by the duration it took to acquire that slice.

3 Motion correction
^^^^^^^^^^^^^^^^^^^

Head motion is the largest source of error in fMRI studies, If the subject in the scanner is moving, the images will look blurry.If the subject moves a lot, we also risk measuring signal from a voxel 
that moves. We are then in danger of measuring signal from the voxel from a different region or tissue type. It is the false positive.In addtion, motion can introduce confounds into the imaging data 
because motion generates signal. If the subject moves every time in response to a stimulus - for example, if he jerks his head every time he feels an electrical shock, then it can become impossible to 
determine whether the signal we are measuring is in response to the stimulus, or because of the movement. Therefore, a variety of strategies have been developed to cope with this problem such as 
immobilization of the head using padding and straps, bite bars, masks during the scanning. What's more, the standard motion correction method of neuroimage packages considers the head as a rigid body 
with three directions of translation (displacement) and three axes of rotation. A single functional volume of a run is chosen as the **reference** to which runs in all other volumes are aligned. 
Procedures are performed in which each volume is rotated and aligned with the reference, with the goal to minimize a cost function. This iterative adjustment terminates once no further improvement can be 
achieved. Most of neuroimage packages provide motion correction function.

.. figure:: MotionCorrectionExample.gif
  
  figure created by Andrew Jahn

4 Registration
^^^^^^^^^^^^^^

Although most people’s brains are similar - everyone has a cingulate gyrus and a corpus callosum, for instance - there are also differences in brain size and shape. As a consequence, if we want to do a 
group analysis we need to ensure that each voxel for each subject corresponds to the same part of the brain. If we are measuring a voxel in the visual cortex, for example, we would want to make sure that 
every subject’s visual cortex is in alignment with each other.

This alignment between the functional and anatomical images is called Registration. Most registration algorithms use the following steps:

1 Assume that the functional and anatomical images are in roughly the same location. If they are not, align the outlines of the images.

2 Take advantage of the fact that the anatomical and functional images have different contrast weightings - that is, areas where the image is dark on the anatomical image (such as cerebrospinal fluid) will appear bright on the functional image, and vice versa. This is called mutual information. The registration algorithm moves the images around to test different overlays of the anatomical and functional images, matching the bright voxels on one image with the dark voxels of another image, and the dark with the bright, until it finds a match that cannot be improved upon.

3 Once the best match has been found, then the same transformations that were used to warp the anatomical image to the template are applied to the functional images.

5 Normalization
^^^^^^^^^^^^^^^

Just as you would fold clothes to fit them inside of a suitcase, each brain needs to be transformed to have the same size, shape, and dimensions. We do this by normalizing (or warping) to a template. A 
template is a brain that has standard dimensions and coordinates - standard, because most researchers have agreed to use them when reporting their results.The dimensions and coordinates of the template 
brain are also referred to as standardized space.

In order to analyze in group level, all of the subjects’ images have been normalized to a template. Although each subjects’ functional images will be transformed to match the general shape and large 
anatomical features of the template, there will be variations in how smaller anatomical regions align among the normalized functional images.

.. image:: Registration_Normalization_Demo.gif
  
  figure created by Andrew Jahn

6 Smoothing
^^^^^^^^^^^

It is common for neuroimage software to smooth the functional data, or replace the signal at each voxel with a weighted average of that voxel’s neighbors. This may seem strange at first - why would we want to make the images 
blurrier than they already are?

Spatial smoothing is the averaging of signals from adjacent voxels. This improves the signal-to-noise ratio (SNR) but decreases spatial resolution, blurs the image, and smears activated areas into 
adjacent voxels. The process can be justified because closely neighboring brain voxels are usually inherently correlated in their function and blood supply. The standard method is to convolve 
("multiply") the fMRI data with a 3D Gaussian kernel ("filter") that averages signals from neighboring voxels with weights that decrease with increasing distance from the target voxel. In practice, the 
full width half maximum (FWHM) value of the Gaussian spatial filter is typically set to about 4-6 mm for single subject studies and to about 6-8 mm for multi-subject analyses. The benefits of smoothing 
can outweigh the drawbacks. For example, we know that fMRI data contain a lot of noise, and that the noise is frequently greater than the signal. By averaging over nearby voxels we can cancel out the 
noise and enhance the signal.

Since smoothing tends to cancel out noise and enhance signal, this can good for group analyses, in which all of the subjects’ images have been normalized to a template. Although each subjects’ functional 
images will be transformed to match the general shape and large anatomical features of the template, there will be variations in how smaller anatomical regions align among the normalized functional 
images. If the images are smoothed, there will be more overlap between clusters of signal, and therefore greater likelihood of detecting a significant effect.

..  figure:: Smoothing_Demo.gif
  
  figure created by Andrew Jahn


If you interested in data quality and proprecess, please go `here <http://mriquestions.com/data-pre-processing.html/>`__
