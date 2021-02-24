Freesurfer
==========

Welcome to FreeSurfer menu
^^^^^^^^^^^^^^^^^^^^^^^^^^

What is FreeSurfer?

FreeSurfer is a brain imaging software package. It focuses on analyzing magnetic resonance imaging (MRI) scans of brain tissue, functional brain mapping and contains tools to conduct both volume-based and surface-based analysis.

FreeSurfer includes tools for the reconstruction of topologically correct and geometrically accurate models of both the gray/white and pial surfaces, for measuring cortical thickness, surface area and folding, and for computing inter-subject registration based on the pattern of cortical folds

.. image:: FreeSurfer1.png 

You can download and install FreeSufer from  `Here <https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall/>`__  or follow the `Video <https://www.youtube.com/watch?v=BSQUVktXTzo&list=PLIQIswOrUH6_DWy5mJlSfj6AWY0y9iUce&index=2/>`__ to set up FreeSufer 

After the installation, type::

  source $FREESURFER_HOME/SetUpFreeSurfer.sh

then, you are supposed to see this 

.. image:: FreeSurfer_ready.png 

From here, We can check the Freesufer taht has been installed, FREESURFER_HOME is the home directory for FreeSufer, SUBJECTS_DIR is the subject dirtory for the FreesSufer program process.


Recon-all
^^^^^^^^^
The most powerful function of FreesSufer is the recon-all command, it will performs all the cortical reconstruction process::

  recon-all -all -i input.file -s output.file

input.file could be either DICOM(T1) or NIFTI file where you can find from the anat folder


Here are the things that recon-all will do: 

Motion Correction and Conform.
NU (Non-Uniform intensity normalization).
Talairach transform computation.
Intensity Normalization 1.
Skull Strip.
EM Register (linear volumetric registration).
CA Intensity Normalization.
CA Non-linear Volumetric Registration.
Remove Neck.
LTA with Skull.
CA Label (Volumetric Labeling, ie Aseg) and Statistics.
Intensity Normalization 2 (start here for control points).
White matter segmentation.
Edit WM With ASeg.
Fill (start here for wm edits).
Tessellation (begins per-hemisphere operations).
Smooth1.
Inflate1.
QSphere.
Automatic Topology Fixer.
Final Surfs (start here for brain edits for pial surf).
Smooth2.
Inflate2.
Spherical Mapping.
Spherical Registration.
Spherical Registration, Contralateral hemisphere.
Map average curvature to subject.
Cortical Parcellation - Desikan_Killiany and Christophe (Labeling).
Cortical Parcellation Statistics.
Cortical Ribbon Mask.
Cortical Parcellation mapping to Aseg.
Noramllly, these processes will cost 8-24 hours for one subjects, however, if you have powerful laptop or Suptercomputer/Server, there is a way that can reduce the time dramatically.


Parallel computing for recon-all
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

A physical core is an actual physical processor core in your CPU. Each physical core has its own circuitry and its own L1 (and usually L2) cache can read and execute instructions separately (for the most part) $

Freesufer support the OpenMP code,recon-all can be processed by multiple-cores,ths means that you can either recon-all one subjects with multiple cores or run recon-all multiple subjecets with many cores$

the command to tell recon-all run multiple cores is -openmp X, X means how many cores you want to run


Segmentation of hippocampal subfields
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Subfields segmentation in Hippocampus



Extract the volume matrix from FreeSurfer
Open the CSV file with Excel 2016.
Look for "Data" tab and "Text in column" button.
In the step 1, select "Delimited".
In the step 2, select first "space", and then choose "string classifier" as ". Then Excel will recognise the string quoted in " " and separate in columns the data with space.
Change format in step 3. "Finish".

FastSurfer
^^^^^^^^^^

`FastSurfer <https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall/>`__ is a fast and deep-learning pipeline for the fully automated processing of structural human brain MRIs. It provides conform outputs like FreeSurfer did, enables big-data analysis and time-critical clinical applications. A `video <https://www.youtube.com/watch?v=V78jKcqVg7k&feature=emb_logo>`__ might help you understand better. 

.. image:: FasteSurfer.png

FastSurfer consists of two main parts:

``FastSurferCNN`` Volumetric Segmentation 

FastSurferCNN is an  advanced deep learning pipline for whole brain segmentation into 95 classes in under 1 minute, mimicking FreeSurfer’s anatomical segmentation and cortical parcellation. 

``recon-surf`` Surface reconstruction

recon-suirf is a full FreeSurfer alternative for cortical surface reconstruction, mapping of cortical labels and traditional point-wise and ROI thickness analysis in approximately 60 minutes.

