SPM introduction 
================

.. image:: spm_logo.png 

What is SPM?

SPM (Statistical Parametric Mapping) is an interactive application that performs statistical analyses of brain imaging data. SPM refers to the construction and assessment of spatially 
extended statistical processes to test functional imaging data. The data could be a series of images from different cohorts or time-series from the same subject. The current release 
version of SPM, SPM12, is designed for the analysis of fMRI, PET, SPECT, EEG and MEG. SPM12 has had several updates since 2014. First released 1st October 2014 and last updated 13th 
January 2020

Downloading and Installing SPM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Unlike AFNI or FSL, SPM is able to run on any operating system as long as it has Matlab installed. Matlab is proprietary software that is quite expensive, but if you are a student or 
university employee you may be able to obtain a copy for free. Once you have installed Matlab, the `SPM website <https://www.fil.ion.ucl.ac.uk/spm/software/spm12/>`__ has instructions 
on how to install the software package. Click on the “download form” button to fill out some personal details such as your position and what you will be using the software for, which 
will enable you to download the software.

.. image:: SPM_path.PNG

Once you have downloaded the SPM package, place it your home directory. Open up Matlab, click on the “Home” tab, and then click the “Set Path” button. Select the spm12 directory, and 
then click “Add with Subfolders”. Click the “Save” button to ensure that the path is set every time Matlab is opened, and then close the window.


After you have set the path, type the following from the Matlab terminal::

  spm

Wait for a few seconds, you will see a SPM GUI

.. image:: SPM_GUI.PNG

Clikc the fMRI, navigate to the fMRI_GUI

.. image:: SPM_fMRI_GUI.PNG


The goal of this chapter is to show you how to run fMRI analysis with SPM step by step. After successfully install SPM and set up, we are going to analyze a dataset with SPM so that 
we can gain some first-hand experiences. The data is Ballon Analogue Risk Task. I hope after this chapter, you will be able to apply the knowledge of AFNI in the future and practice 
with other datasets you have.

We will start with the dataset downloading, preprocessing, 1st level, and end with group analysis as follow:


.. toctree::
   :maxdepth: 1
   :caption: Content

   SPM/SPM_index.rst
   SPM_Ballon/SPM_Ballon.rst 
   SPM_preprocessing/preprocessing.rst
   SPM_Statistics_Modeling/statistics_Medeling.rst
   SPM_1st_Level_analysis/1st_Level_analysis.rst
   SPM_Automation/automation_2.rst
   SPM_group_analysis/group_analysis.rst
   SPM_ROI/ROI_analysis.rst
