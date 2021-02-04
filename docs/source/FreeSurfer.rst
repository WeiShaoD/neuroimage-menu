Freesufer
=========

Welcome to the Freesufer unit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What is FreeSufer?

FreeSurfer is a brain imaging software package. It focuses on analyzing magnetic resonance imaging (MRI) scans of brain tissue, functional brain mapping and contains tools to conduct both volume-based and surface-based analysis.

FreeSurfer includes tools for the reconstruction of topologically correct and geometrically accurate models of both the gray/white and pial surfaces, for measuring cortical thickness, surface area and folding, and for computing inter-subject registration based on the pattern of cortical folds

.. image:: FreeSurfer1.png 

You can download and install FreeSufer from * `Here <https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall/>`__  *  

 `SPM <https://www.fil.ion.ucl.ac.uk/spm/>`__ (Statistical Parametric Mapping, created by University College London)


recon-all
^^^^^^^^^
The most powerful function of FreesSufer is the recon-all command, it will performs all the cortical reconstruction process::

  recon-all -all -i input.file -s output.file

input.file could be either DICOM(T1) or NIFTI file where you can find from the anat folder


Here are the things that recon-all will do: 

Motion Correction and Conform

NU (Non-Uniform intensity normalization)

Talairach transform computation

Intensity Normalization 1

Skull Strip

EM Register (linear volumetric registration)

CA Intensity Normalization

CA Non-linear Volumetric Registration

Remove Neck

LTA with Skull

CA Label (Volumetric Labeling, ie Aseg) and Statistics

Intensity Normalization 2 (start here for control points)

White matter segmentation

Edit WM With ASeg

Fill (start here for wm edits)

Tessellation (begins per-hemisphere operations)

Smooth1

Inflate1

QSphere

Automatic Topology Fixer

Final Surfs (start here for brain edits for pial surf)

Smooth2

Inflate2

Spherical Mapping

Spherical Registration

Spherical Registration, Contralateral hemisphere

Map average curvature to subject

Cortical Parcellation - Desikan_Killiany and Christophe (Labeling)

Cortical Parcellation Statistics

Cortical Ribbon Mask

Cortical Parcellation mapping to Aseg

Noramllly, these processes will cost 8-24 hours for one subjects, however, if you have powerful laptop or Suptercomputer/Server, there is a way that can reduce the time dramatically.


parallel computing for recon-all
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

A physical core is an actual physical processor core in your CPU. Each physical core has its own circuitry and its own L1 (and usually L2) cache can read and execute instructions separately (for the most part) $

Due to Freesufer emalble the OpenMP code,recon-all can be processed by multiple-cores,ths means that you can either recon-all one subjects with multiple cores or run recon-all multiple subjecets with many cores$

the command to tell recon-all run multiple cores is -openmp X, X means how many cores you want to run

