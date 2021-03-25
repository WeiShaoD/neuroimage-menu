Freesurfer
==========

Now, it is time for our first main course, FreeSurfer.

What is FreeSurfer?

FreeSurfer is a brain imaging software package that focuses on analyzing magnetic resonance imaging (MRI) and functional scans of brain tissue from cross-sectional or longitudinal research, it can help 
researchers to conduct both volume-based and surface-based analyses. It is developed by the Laboratory for Computational Neuroimaging at the Athinoula A. Martinos Center for Biomedical Imaging. 
FreeSurfer includes tools for the reconstruction of topologically correct and geometrically accurate models of both the gray/white and pial surfaces, for measuring cortical thickness, surface area and 
folding, and for computing inter-subject registration based on the pattern of cortical folds

.. image:: FreeSurfer1.png 

Installation
^^^^^^^^^^^^

You can download and install FreeSufer from `Here <https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall/>`__ and follow the `Video 
<https://www.youtube.com/watch?v=BSQUVktXTzo&list=PLIQIswOrUH6_DWy5mJlSfj6AWY0y9iUce&index=2/>`__ to set up FreeSurfer

There are different versions of Freesurfer, it is recommended to use the latest one but Freesufer6.0.0 and above would be appropriate. After the installation, type::

  source $FREESURFER_HOME/SetUpFreeSurfer.sh

Then, you are supposed to see this 

.. image:: FreeSurfer_ready.png 

We can check whether Freesufer has been installed, there are two important messages for FreeSurfer, 1 FREESURFER_HOME is the home directory where your FreeSufer has been installed, 2 SUBJECTS_DIR is the 
subject directory where you point for the FreesSufer output results.

Test your FreeSurfer
********************

You also want to test the freesurfer performance before it run the actual data.

Go to freesurfer subject directory::

  cd $FREESURFER_HOME/subjects/

put ``mri_convert sample-001.mgz sample-001.nii.gz`` to test Freesurfer. Due to different requirements of different versions of Freesurfer, you might meet a license problem. 

..  image:: Freesurfer_test.PNG 

Recon-all
^^^^^^^^^

The most useful function of FreesSufer is the recon-all command, it will tell Freesufer to performs all, or any part of if you specifiy, the FreeSurfer cortical reconstruction process. the basic format::

  recon-all -all -i subjname_T1w.nii.gz -s subjname

-all tells Freesurfer to do everything, including subcortical segmentation
 
-i stands for input

-s subjet id

Normally, the input file would be T1 file, you also can improve the quality of surfaces by feed the T2 such as ``recon-all -subject subjectname -i /path/to/input_volume -T2 /path/to/T2_volume -T2pial 
-all`` FreeSurfer provided a tutorial `dataset <http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/Data>`__ for you to play around it. You can follow this `link 
<http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/Practice>`__ to play with recon-all command.

Tutorial data practice
**********************

Once you have download the tutorial dataset, ``cd`` to ``tutorial_data_20190918_1558/practice_with_data`` and put ``export SUBJECTS_DIR=$PWD`` to specify the subject output directory to the current 
directory , then, go to ``dicoms`` and input ``recon-all -all -i I50 -s Subj001`` to take the I50 and create the Subj001 output. Of course, make sure you have activated the Freesurfer by ``srouce 
$FREESURFER_HOME/SetUpFreeSurfer.sh`` before you run the command. Here is a detailed instruction and a function list for `recon-all <https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all/>`__ . 
``recon-all`` usually will cost 6-8 hours, depends on the computing power you have. Fortunately, there is a way to speed up this process.
 
.. image:: Freesurfer_reconall.PNG

This will cost a few hours but we will come up with a solution to save our time in the next chapter. you will see a new directory has been created in the freesufer subject directory

.. image:: Freesurfer_reconoutput.PNG

There are 3 directories you need to pay attention to, **mri** has all the volume file, **surf** contains all the surface outcome and scripts keep all the log information.

Freeview
^^^^^^^^
                                                                                                                                                                                                           
Freeview is a visualization tool comes with Freesufer, you could test the freeview as well. ``cd $SUBJECTS_DIR``, and type::
  
  freeview -v \
    bert/mri/T1.mgz \
    bert/mri/brainmask.mgz \
    bert/mri/aseg.mgz:colormap=lut:opacity=0.2
                                                                      

freeview will invoke the freeview 

The flag -v is used to indicated that we are open volumes, T1.mgz: T1 anatomical image, brainmask.mgz: skull-stripped volume primarily used for troubleshooting, aseg.mgz : subcortical segmentation loaded 
with its corresponding color table and at a opacity=0.2 

.. image:: Freesufer_freeviewbert.PNG

Freeview window will appear and load the data, it is important to ensure that you have install the Xming if you use WSL. You are able to see there is new directory has been created with the name you gave 
before, go the mri directory.

.. image:: Freesuefer_mri.PNG 

More details from `freeview <http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/OutputData_freeview/>`__


Segmentation of hippocampal subfields
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

One of important function of FreeSurfer is the subfield segmentation of Hippocampus and amygdala

After ``recon-all`` has been completed, you can take the output from ``recon-all`` and the pipline::

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

[lr]h.hippoAmygLabels-T1.v21.FSvoxelSpace.mgz: they store the discrete segmentation volume in the FreeSurfer voxel space (normally 1mm isotropic, unless higher resolution data was used in recon-all with 
the flag -cm).

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

Once we use the freesurfer automated segmentation, we can also collect the volumes of the subregions of the hippocampus / amygdala of all subjects and write them to a single file, ectracting the volume 
matrix::

  quantifyHAsubregions.sh hippoSf <T1> <output_file> 
 
The first argument ``quantifyHAsubregions.sh`` specifies that we want to collect the volumes of the hippocampus (hippoSf). The second argument is the name of the analysis: for the first mode of operation 
(only main T1 scans), it is simply type T1, and don't forget to name the output_file.

After a few seconds, you will see the output files in the current directory, open it with ``less`` 

.. image:: volume_matrix.PNG

What a mess! Fortunately, there is a solution.
 
1 Open the file with Excel 2016.

2 Look for "Data" tab and "Text in/to column" button.

3 In the step 1, select "Delimited".

4 In the step 2, select first "space", and then choose "string classifier" as "." 

Change format in step 3. "Finish". And save as csv file

Then, You will get a file like this 

.. image:: volume_martix_Excel.PNG

and have fun by play it around like PCA analysis.

.. image:: hipp_vol.png

FreeSurfer support email list
*****************************

At the end of the day, you will realize that many problems and issues could be very tricky when you use FreeSurfer constantly, Luckily, there are many FreeSurfer experts who are ready to help you.Follow 
the `link <https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferSupport/>`__, all of your questions will be answered in there.


