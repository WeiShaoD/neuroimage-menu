Preprocessing
=============

Like a good dish needs some preprocessed step, Preprocessing is necessary for fMRI analysis as well. there are serveal steps in FSL::

  Skull stripping
 
  Motion correction
  
  Slice-Timing Correction

  Smoothing

  Registration and Normalization 

We will operate these one by one, Are you ready? 

looking at the data
^^^^^^^^^^^^^^^^^^^

Before we are actually running the analysis, it is safe for us to check the data for any problems such as scanner spikes, incorrect orientation, or poor contrast and so on.Although it might be unnecessary for the open neuroimaging data, it is really important for your to check the image before when it comes to your own data.

Inspecting the anatomical image
*******************************

Open you terminal and cd to the BART directory by typing ``cd BART``.

.. image:: FSL_cd_BART.png

type ``fsl`` to open the ``FSL GUI tool``

.. image:: FSL_GUI.png

click ``FSLView`` and ``File`` to find the anat T1 image, sub-01_T1w.nii.gz and func image sub-01_task-balloonanalogrisktask_run-01_bold.nii.gz

.. image:: FSL_FSLView_anat.png 
.. image:: FSL_FSLView_func.png

Skull stripping

FSL provided a function that can help you skullstripping 

1 open fsl gui by type `fsl`


In the Search window, there are three options: 1) No search; 2) Normal search; and 3) Full search. This signifies to FSL how much to search for a good initial alignment between the functional and anatomical images (for registration) and between the anatomical and template images (for normalization). The Full search option takes longer, but is more thorough and therefore more likely to produce better registration and normalization.


Although the script can help you to run all the 34 subjects, But it is recommended to run subjects one by one so you can familair all the processes 


Motion Correcation
******************

Slice-Timing Correction
***********************

Smoothing
^^^^^^^^^

Registration and Normalization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Check the Preprocessed Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^






