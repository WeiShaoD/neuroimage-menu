Freesurfer
==========

What is FreeSurfer?

FreeSurfer is a brain imaging software package. It focuses on analyzing magnetic resonance imaging (MRI) scans of brain tissue, functional brain mapping and contains tools to conduct both volume-based and surface-based analysis.

FreeSurfer includes tools for the reconstruction of topologically correct and geometrically accurate models of both the gray/white and pial surfaces, for measuring cortical thickness, surface area and folding, and for computing inter-subject registration based on the pattern of cortical folds

.. image:: FreeSurfer1.png 

You can download and install FreeSufer from  `Here <https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall/>`__  or follow the `Video <https://www.youtube.com/watch?v=BSQUVktXTzo&list=PLIQIswOrUH6_DWy5mJlSfj6AWY0y9iUce&index=2/>`__ to set up FreeSufer 

After the installation, type::

  source $FREESURFER_HOME/SetUpFreeSurfer.sh

Then, you are supposed to see this 

.. image:: FreeSurfer_ready.png 

We can check the Freesufer that has been installed, there are two important directory for FreeSurfer, FREESURFER_HOME is the home directory for FreeSufer, SUBJECTS_DIR is the subject dirtory for the FreesSufer output


Recon-all
^^^^^^^^^

The most useful function of FreesSufer is the recon-all command, after you set up the FreeSurfer subject directory and active FreeSrufer, you can use it by typing::

  recon-all -all -i subjname_T1w.nii.gz -s subjname

input could be either DICOM(T1) or NIFTI T1 files where you can find from the anat folder normally. Here is a detailed instruction and a list for `recon-all <https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all/>`__ will do. Recon usually will cost 6-8 hours, depends on the computing power you you have.


Freeview
^^^^^^^^
Once the recon-all finished, you are able to see there is new directory has been created with the name you gave before, go the mri directory 

.. image:: Freesuefer_mri.PNG 

Now, you can the view the volumes such as brainmask.mgz and wm.mgz; the surfaces, rh.white and lh.white; and the subcortical segmentation, aseg.mgz::

  freeivew -v T1.mgz -v wm.mgz -v brainmask.mgz aseg.mgz:colormap=lut:opacity=0.2

The flag -v is used to open some of the most commonly used volumes including
brainmask.mgz : skull-stripped volume primarily used for troubleshooting
wm.mgz : white matter mask also used for troubleshooting
aseg.mgz : subcortical segmentation loaded with its corresponding color table and at a low opacity

or go to the surf directory::
 
  freeview -f lh.pial:edgecolor=red rh.white:edgecolor=blue rh.pial:edgecolor=red

The flag -f is used to load surfaces
white & pial surfaces are loaded for each hemisphere & with color indicated by 'edgecolor'

Now, you can use freeview to check the output of recon-all

Go to the mri directory, typing::

  freeview -v T1.mgz wm.mgz brainmask.mgz aseg.mgz
   

for more details about `freeview <http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/OutputData_freeview/>`__


Parallel computing for recon-all
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

A physical core is an actual physical processor core in your CPU. Each physical core has its own circuitry and its own L1 (and usually L2) cache can read and execute instructions separately (for the most part) $

Freesufer support the OpenMP code,recon-all can be processed by multiple-cores,ths means that you can either recon-all one subjects with multiple cores or run recon-all multiple subjecets with many cores$

the command to tell recon-all run multiple cores is -openmp X, X means how many cores you want to run


Segmentation of hippocampal subfields
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Subfields segmentation in Hippocampus

After ``recon-all`` has been completed, you can use T1 scan from ``recon-all`` and the pipline::

  segmentHA_T1.sh subject_name [SUBJECTS_DIR]

[SUBJECTS_DIR] is optional, the output files will be appear in the mri directory of SUBJECT_DIR ($SUBJECTS_DIR/subjects_name/mri/)

You can check the outfiles with freeview::

  freeview -v nu.mgz -v lh.hippoAmygLabels-T1.v21.mgz:colormap=lut -v rh.hippoAmygLabels-T1.v21.mgz:colormap=lut
  freeview -v nu.mgz -v lh.hippoAmygLabels-T1.v21.HBT.mgz:colormap=lut -v rh.hippoAmygLabels-T1.v21.HBT.mgz:colormap=lut
  freeview -v nu.mgz -v lh.hippoAmygLabels-T1.v21.FS60.mgz:colormap=lut -v rh.hippoAmygLabels-T1.v21.FS60.mgz:colormap=lut
  freeview -v nu.mgz -v lh.hippoAmygLabels-T1.v21.CA.mgz:colormap=lut -v rh.hippoAmygLabels-T1.v21.CA.mgz:colormap=lut

[lr]h.hippoSfVolumes-T1.v21.txt: these text files store the estimated volumes of the hippocampal substructures and of the whole hippocampus..

[lr]h.amygNucVolumes-T1.v21.txt: these text files store the estimated volumes of the nuclei of the amygdala and of the whole amygdala.

[lr]h.hippoAmygLabels-T1.v21.mgz: they store the discrete segmentation volumes at subvoxel resolution (0.333 mm).

[lr]h.hippoAmygLabels-T1.v21.FSvoxelSpace.mgz: they store the discrete segmentation volume in the FreeSurfer voxel space (normally 1mm isotropic, unless higher resolution data was used in recon-all with the flag -cm). 

[lr]h.hippoAmygLabels-T1.v21.[hierarchy].mgz: they store the segmentations with the different hierarchy levels.

[lr]h.hippoAmygLabels-T1.v21.[hierarchy].FSvoxelSpace.mgz: same as above, but in FreeSurfer voxel space.

In addtion T1 scan, you can also use T2 scan as an addtional scan::

  segmentHA_T2.sh  subjects_name  FILE_ADDITIONAL_SCAN   ANALYSIS_ID  USE_T1  [SUBJECTS_DIR]

FILE_ADDITIONAL_SCAN is the additional scan to use in the segmentation

ANALAYSIS_ID is a user defined identifier that makes it possible to run different analysis with different types of additional scans

USE_T1 is a flag that indicates whether the intensities of the main T1 scan should be used (multispectral segmentation). The words USE_T1 must be replaced with a 0 or 1 on the command line

SUBJECTS_DIR is optional, and overrides the FreeSurfer subject directory when provided
                                                                                                               
For MacOC user, please follow this `video <https://www.youtube.com/watch?v=0R6SJI9MvYM&t=429s/>`__

Go `HippocampalSubfieldsAndNucleiOfAmygdala  <https://surfer.nmr.mgh.harvard.edu/fswiki/HippocampalSubfieldsAndNucleiOfAmygdala/>`__ to see all the instructions

Extract the volume matrix from FreeSurfer  
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Once we use the freesurfer automated segmentation, we can also collect the volumes of the subregions of the hippocampus / amygdala of all subjects and write them to a single file, ectracting the volume matrix::

  quantifyHAsubregions.sh hippoSf <T1> <output_file> 
 
The first argument ``quantifyHAsubregions.sh`` specifies that we want to collect the volumes of the hippocampus (hippoSf). The second argument is the name of the analysis: for the first mode of operation (only main T1 scans), it is simply type T1, and don't forget to name the output_file.

After a few seconds, you will see the output files in the current directory, open it with ``less`` 

.. image:: volume_matrix.PNG

What a mess! fortunately, there is a solution.
 
1 Open the file with Excel 2016.

2 Look for "Data" tab and "Text in/to column" button.

3 In the step 1, select "Delimited".

4 In the step 2, select first "space", and then choose "string classifier" as "." 

Change format in step 3. "Finish". And save as csv file

Then, You will get a file like this 

.. image:: volume_martix_Excel.PNG

and have fun by play it around like PCA analysis.

.. image:: hipp_vol.png

FastSurfer
^^^^^^^^^^

`FastSurfer <https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall/>`__ is a fast and deep-learning pipeline for the fully automated processing of structural human brain MRIs. It provides conform outputs like FreeSurfer did, enables big-data analysis and time-critical clinical applications. A `video <https://www.youtube.com/watch?v=V78jKcqVg7k&feature=emb_logo>`__ might help you understand better. 

.. image:: FasteSurfer.png

FastSurfer consists of two main parts:

``FastSurferCNN`` Volumetric Segmentation 

FastSurferCNN is an advanced deep learning pipline for whole brain segmentation into 95 classes in under 1 minute, mimicking FreeSurfer’s anatomical segmentation and cortical parcellation. 

``recon-surf`` Surface reconstruction

recon-suirf is a full FreeSurfer alternative for cortical surface reconstruction, mapping of cortical labels and traditional point-wise and ROI thickness analysis in approximately 60 minutes.

go to `Here <https://github.com/deep-mi/FastSurfer>`__ either use ``git clone`` from you home directory to ge the file or download the file and put it in your home directory 

# set up 
Set the path ``export FREESURFER_HOME=/usr(usrname)/local/freesurfer/7.1.1-1``
Use ``source $FREESURFER_HOME/SetUpFreeSurfer.sh`` to activate the Freesurfer

datadir=/home/user/mri_data_directory
fastsurferdir=/home/user/fastsurfer_analysis_directory 

# Run FastSurfer
./run_fastsurfer.sh --t1 $datadir/subject1/orig.mgz \
                    --sid subject1 --sd $fastsurferdir \
                    --parallel --threads 4

``--sd``  Output directory $SUBJECTS_DIR 

``--sid`` Subject ID for directory inside $SUBJECTS_DIR to be created 

``--t1``  T1 full head input. The network was trained with conformed images (UCHAR, 256x256x256, 1 mm voxels and standard slice orientation). These specifications are checked in the eval.py script and the image is automatically conformed if it does not comply.

Before you run the script, just ensure you check all the required packages 
``sed -i "s/==/>=/g" requirements.txt`` and ``pip install --no-index -r requirements.txt`` might help

This is a fast alternative way to do the Freesurfer job
