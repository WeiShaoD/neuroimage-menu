Preprocessing
=============

Like a good dish needs some preprocessed step, Preprocessing is necessary for fMRI analysis as well. there are serveal steps in FSL::

  Skull stripping
 
  Motion correction
  
  Slice-Timing Correction

  Smoothing

  Registration and Normalization 

We will operate these one by one, Are you ready? 

Inspecting the image
^^^^^^^^^^^^^^^^^^^^

Before we are actually running the analysis, it is safe for us to check the data for any problems such as scanner spikes, incorrect orientation, or poor contrast and so on.Although it might be unnecessary for the open neuroimaging data, it is really important for your to check the image before when it comes to your own data.

Open you terminal and cd to the BART directory by typing ``cd BART``.

.. image:: FSL_cd_BART.png

type ``fsl`` to open the ``FSL GUI tool``

.. image:: FSL_GUI.png

click ``FSLView`` and ``File`` to find the anat T1 image, sub-01_T1w.nii.gz and func image sub-01_task-balloonanalogrisktask_run-01_bold.nii.gz

.. image:: FSL_FSLView_anat.png 
.. image:: FSL_FSLView_func.png

For more information, please go to `here <http://www.mrishark.com/brain1.html>`__ 

Skull stripping
^^^^^^^^^^^^^^^

Brain tissue is the focus of fMRI studies, our first step is to seperate the skull and non-brain areas from the image. FSL provides a function that can help you achieve the goal.

Oppen FSL GUI by typing ``fsl``and select the first function on the GUI list, it called ``BET brain extraction``. Click the button, a new window will open up. In the input image, click the file icon, select the ``sub-01``, then ``anat``and ``sub-01_T1w.nii.gz``. The output image will be generated automatically. 

.. image:: FSL_select_anat.png

.. image:: FSL_skull_output.png

Adjust the stripping range
**************************

You might notice that there is column called Fractional intensity threshold, as the description, you can adjust the number for the skull stripping range. If you think that too much brain has been removed, you should set this to a smaller number, and vice versa if you think too little skull has been removed.The defult is 0.5.


Motion Correcation
^^^^^^^^^^^^^^^^^^

The concept is the same when we take three-dimensional pictures of the brain. If the subject is moving, the images will look blurry; if the subject is still, the images will look more defined. But that’s not all: If the subject moves a lot, we also risk measuring signal from a voxel that moves. We are then in danger of measuring signal from the voxel for part of the experiment and, after the subject moves, from a different region or tissue type.

Motion can introduce confounds into the imaging data because motion generates signal. If the subject moves every time in response to a stimulus - for example, if he jerks his head every time he feels an electrical shock - then it can become impossible to determine whether the signal we are measuring is in response to the stimulus, or because of the movement.

.. image:: FSL_motion.jpg

Slice-Timing Correction
***********************

Smoothing
^^^^^^^^^

Registration and Normalization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the Search window, there are three options: 1) No search; 2) Normal search; and 3) Full search. This signifies to FSL how much to search for a good initial alignment between the functional and anatomical image

Check the Preprocessed Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^





