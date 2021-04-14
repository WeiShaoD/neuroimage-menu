Preprocessing
=============

Remember our drink menu? It is a little different for what we should do in SPM but overall there are very similar, Anyway, let’s have a couple of drinks before the meal

Since we have download and rename the dataset, let's look at our data first to check if there are any artifacts or problems with the image data. call the ``Matlab`` and navigate to **BART_spm** directory.

Viewing the Anatomical images 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Whenever you download imaging data, check the anatomical and functional images for any artifacts - scanner spikes, incorrect orientation, poor contrast, and so on. It will take some time to develop an 
eye for what these problems look like, but with practice it will become quicker and easier to do.

To begin, let’s take a look at the anatomical image in the anat folder for sub-02. If you haven’t already opened SPM, navigate to the sub-02 folder and then type::

  spm fmri

and press return, which will open the SPM graphical user interface. If you click on the ``Display`` button, you will be prompted to select an image.

.. image:: SPM_display.PNG

.. note::

  SPM can read any image that are in NIFTI format, but they cannot be compressed - that is, if the datasets end with a .gz extension, you will first need to unzip them by navigating to the directory 
containing the images and then type ``gunzip *.gz`` 

Viewing the Functional images
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When you are done looking at the anatomical image, click on the Display button again, navigate to the func directory, and select the **run-01** functional image.

A new image will be displayed in the orthogonal viewing windows. This image also looks like a brain, but it is not as clearly defined as the anatomical image. This is because the resolution is lower. It 
is typical for a study to collect a high-resolution T1-weighted (i.e., anatomical) image and lower-resolution functional images, which are lower resolution in part because they are collected at a very 
fast rate. One of the trade-offs in imaging research is between spatial resolution and temporal resolution: Images collected at higher temporal resolution will have lower spatial resolution, and vice 
versa.

.. image:: SPM_dsiplay_2.PNG


During the Realignment preprocessing step you will generate a movement parameter file showing how much motion there was between each volume.

Realignment and Slice-Timing Correction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similarly, when we preprocess fMRI data we are cleaning up the three-dimensional images that we acquire every TR. An fMRI volume contains not only the signal that we are interested in - changes in 
oxygenated blood - but also fluctuations that we are not interested in, such as head motion, random drifts, breathing, and heartbeats. We call these other fluctuations noise, since we want to separate 
them from the signal that we are interested in. Some of these can be regressed out of the data by modeling them (which is discussed in the chapter on modeling fitting), and others can be reduced or 
removed by preprocessing.

To begin preprocessing sub-02 data, read through the following chapters. We will begin with Realignment and Slice-Timing Correction, which correct misalignments and timing errors in the functional 
images, before moving on to Coregistration and Normalization, which align the functional and structural images and move them both to a standardized space. Finally, the images are Smoothed in order to 
increase signal and cancel out noise. The typical sequence of preprocessing steps is numbered in the image below:

.. image:: SPM_Realignment.PNG

The first step of preprocessing is to realign the functional images. If you think of a time-series as a deck of cards, with each volume as a separate card, realignment will put all the cards in the same 
orientation and make the sides line up - similar to what you do after you shuffle a deck of cards.

If you click on the button Realign (Estimate & Reslice), a window opens up showing the options for realigning and reslicing the data. The Estimate part refers to estimating the amount that each volume is 
out of alignment with a reference volume, and Reslice indicates that these estimates will be used to nudge each of the volumes into alignment with the reference volume. The reference volume is set in the 
field “Num Passes”, which allows you to specify whether the volumes will be aligned to the mean of all of the volumes, or to the first volume. For this tutorial, leave it as the default, and leave the 
rest of the defaults alone, as well.

.. image:: SPM_realignment_Data.PNG

Loading the Images
^^^^^^^^^^^^^^^^^^

In this experiment, there were three runs of data in per subject ( each run of SPM refers as a session). Look at the Data tab, click on **New: Session** to add three sessions. An <-X appeared to the 
right of each Session field. Click Specify at the button to open up the Image Selection window. Navigate to the func directory of sub-02 and select the file 
"sub-02_task-balloonanalogrisktask_run-01_bold.nii,1"", 1 in here indicates that only the first frame, or volume, is available. However, In order to select all of the volumes for this run, type 1:300 and 
press enter in the "Frames field" (underneath the Filter field) to expand the 300 number of frames available for selection.

.. note::
 
  If you don’t know how many frames are in the current dataset, you can use ``3dinfo`` and ``mri_info`` command to check the frrams if you have installed AFNI or freesurfer. or you can set the upper 
bound to an high number like 1:10000. The list of files will max out at the number of available frames, and so will ensure that you do not miss any.

.. image:: SPM_frame_3dinfo.PNG

.. image:: SPM_mriinfo.PNG

You might notice that all of the **frames** for run-01, run-02 and run-03 have been selected, even though we only want the frames for run-01. You could simply click and drag from frame 1 to frame 
300 for run-01, but you risk accidentally including other frames by mistake. To restrict our file selection to only the frames we are interested in, on the other hand, we can use the Filter field. This 
field uses   regular expressions, a type of coding shorthand to indicate which characters to include in a string. In this case, to the left of the .* characters that are already in the field, type run-01 
and press return. This will refresh the screen to display only those frames which include the string run-01. Either click and drag to select all of the images, or right click in the selection window and 
click Select All.

.. image:: SPM_data.PNG

You need to repeat all the steps above and choose 300 frames from the choose **run-02** and **run-03** 

.. image:: SPM_data_finish.PNG
