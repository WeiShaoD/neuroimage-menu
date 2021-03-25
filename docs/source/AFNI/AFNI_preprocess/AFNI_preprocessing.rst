Preprocessing
=============

Remember our drink menu? It is a little different for what we should do in AFNI but overall there are very similar, Anyway, let’s have a couple of drinks before the meal:

Inspecting the image
^^^^^^^^^^^^^^^^^^^^

Before we are actually running the analysis, it is beneficial for us to check the data for any problems such as scanner spikes, incorrect orientation, or poor contrast, and so on. Although it might be 
unnecessary for the open neuroimaging data, it is really important for you to check the image before when it comes to your own data.

Let's start from **sub-02**, ``cd`` to ``BART_afni/sub-02/anat`` directory and type ``afni`` to open the AFNI graphical user interface. you might see this

.. image:: AFNI_cashlog.PNG

That because AFNI will look for any images in the current directory by default - and load all of them into the program. If you want to load only the anatomical T1 image into the AFNI viewer, you would 
either go to sub-02/anat and type type: ``afni sub-02_T1w.nii.gz`` or type ``afni anat/sub-02_T1w.nii.gz`` from ``sub-02`` directory

uber_subject
************

.. image:: AFNI_preprocess.png

Skull stripping
^^^^^^^^^^^^^^^

Motion correction
^^^^^^^^^^^^^^^^^

Slice-Timing Correction
^^^^^^^^^^^^^^^^^^^^^^^

Smoothing
^^^^^^^^^

Registration and Normalization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Check the Preprocessed Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^

uber_subject



epi = echo planar image
