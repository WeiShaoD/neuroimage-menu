Longitudinal processing 
======================= 

All data for this tutorial has already been processed for you since processing can take up to 24h. However, to continue you need to understand the three processing steps (cross, base, long) and 
associated directory names.

Let's say we have a subject name sub with two time points: time_point_1 and time_point_2. Here are 3 major parts of data FreeSurfer processed:

[**CROSS**]: There are two images independently first (cross in crossectional analysis/processing) come from ``recon-all``::

recon-all -subjid input_T1_point1 -all
recon-all -subjid input_T1_point2 -all

After FreeSurfer processed the same subject with two timepoints, There are two new directories with the name ``Timepoint_1`` and ``Timepoint_2`` appeared in the SUBJECTS_DIR directory.Then, we are going 
to continue the second step.
 
[**BASE**]: The aim of this processing is to create a within-subject template (also called base) and end up with a new directory. There is only one base directory for per subject. FreeSurfer decides to name 
the base: base_subj. Inside this directory are the results for the average anatomy of the subject across time. we can use this data for quality checking or editing::

recon-all -base base_subj -tp Timepoint_1 -tp Timepoint_2 -all

[**LONG**]: Finally, we would need to create the two longitudinal runs for our subject (these are the ones we are actually interested in). There are new two more directories (FreeSurfer will automatically 
assign the name: ``Timepoint_1.long.base_subj`` and ``Timepoint_2.long.base_subj``. They are the final, most reliable and accurate processing results

Longitudinal processing in hippocampus
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Longitudinal analysis greatly reduces the confounding effect of inter-individual variability by using each subject as his or her own control. While one could analyze each time independently with 
segmentHA_T1.sh, such a cross-sectional analysis disregards the key fact that the scans are of the same subject. Instead, the scans corresponding to the different time points can be segmented jointly. 
FreeSurfer method relies on a subject-specific atlas, and treats all time points the same way in order to avoid processing bias. It is important to remark that this method does not assume any specific 
trajectory for the segmentations or corresponding volumes. Essentially, this means this method does not assume that the hippocampus continuously shrinks or grows.

Let's say that <baseID> is the ID of the base subject (template from mainstream). Then, we can produce the longitudinal hippocampal subregion segmentation with the following command:

segmentHA_T1_long.sh <baseID>

The output of this script can be found under the corresponding mri directories of the longitudinally processed subjects, which located at Timepoint_1.long.base_subj/mri The output files will contain the 
suffix .long such as:

[lr]h.hippoAmygLabels-T1.long.v21.[hierarchy].<FSvoxelSpace>.mgz: segmentations:

lh.hippoAmygLabels-T1.long.v21.CA.FSvoxelSpace.mgz

lh.hippoAmygLabels-T1.long.v21.CA.mgz

lh.hippoAmygLabels-T1.long.v21.FS60.FSvoxelSpace.mgz

lh.hippoAmygLabels-T1.long.v21.FS60.mgz

lh.hippoAmygLabels-T1.long.v21.FSvoxelSpace.mgz

lh.hippoAmygLabels-T1.long.v21.HBT.FSvoxelSpace.mgz

lh.hippoAmygLabels-T1.long.v21.HBT.mgz

[lr]h.hippoSfVolumes-T1.long.v21.txt: volumes of the hippocampal substructures:

lh.hippoSfVolumes-T1.long.v21.txt

[lr]h.amygNucVolumes-T1.long.v21.txt: volumes of the nuclei of the amygdala:

lh.amygNucVolumes-T1.long.v21.txt

Visualization
^^^^^^^^^^^^^

Bear in mind that the longitudinally processed time points are coregistered, so you can overlay their images and segmentations on top of each other. if you have two longitudinally processed subjects 
timepoint1.long.baseID and timepoint2.long.baseID, From SUBJECTS_DIR, you could run::

  freeview -v timepoint1.long.baseID/mri/nu.mgz -v timepoint1.long.baseID/mri/lh.hippoAmygLabels-T1.long.v21.mgz:colormap=lut -v timepoint1.long.baseID/mri/rh.hippoAmygLabels-T1.long.v21.mgz:colormap=lut \
           -v timepoint2.long.baseID/mri/nu.mgz -v timepoint2.long.baseID/mri/lh.hippoAmygLabels-T1.long.v21.mgz:colormap=lut -v timepoint2.long.baseID/mri/rh.hippoAmygLabels-T1.long.v21.mgz:colormap=lut


Volume extraction
^^^^^^^^^^^^^^^^^

We can extract the volume matrix from the longitudinal result FreeSurfer has processed. We can also collect the volumes of the subregions of the hippocampus/amygdala of all subjects and write them to a 
single file, ectracting the volume matrix::

  quantifyHAsubregions.sh hippoSf T1 <output_file directory>

After a few seconds, you will see the output files in the current directory, open it with ``less`` or any text editor.

