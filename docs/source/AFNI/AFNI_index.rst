.. _AFNI introduction:

================
Overview in AFNI 
================


.. image:: AFNI_logo.PNG

Let's enjoy the main course 3 AFNI!

So, What is AFNI?

AFNI (Analysis of Functional NeuroImages) is a software suite developed by C, Python, R programs and shell scripts, it is built for the analysis and display
of multiple MRI modalities: anatomical, functional MRI (FMRI) and diffusion weighted (DW) data. It is freely available for research purposes. The software is
made to run on virtually any Unix system with X11 and Motif displays. Binary packages are provided for MacOS and Linux systems such as Fedora, CentOS/Red Hat
and Ubuntu (which includes the Windows Subsystem for Linux).

Please follow this `link <https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/index.html>`__ to find the suitable AFNI for
your computer and install

The goal of this chapter is to show you how to run fMRI analysis with AFNI step by step. After successfully install AFNI and set up, we are going to analyze
a dataset with AFNI so that we can gain some first-hand experiences. The data is Ballon Analogue Risk Task. I hope after this chapter, you will be able to
apply the knowledge of AFNI in the future and practice with other datasets you have.

We will start with the dataset downloading, preprocessing, 1st level, and end with group analysis as follow:


.. toctree::
   :maxdepth: 1
   :caption: Content
   
   AFNI_Ballon/AFNI_Ballon.rst
   AFNI_preprocess/AFNI_preprocessing_1.rst
   AFNI_preprocess/AFNI_preprocessing_2.rst
   AFNI_preprocess/Preprocessed_check.rst
   AFNI_statistics/AFNI_statistics_modeling.rst
   AFNI_1st/AFNI_1st_level.rst
   AFNI_automation/Aumomation_menu.rst
   AFNI_group/group_analysis.rst
   AFNI_ROI/ROI_analysis.rst
