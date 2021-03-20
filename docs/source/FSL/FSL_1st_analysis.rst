1st level analysis
==================

I hope you still remember that all the preprocessing we have done previously becuase we are ready go to the next.

With the goal of creating the model with a ideal time-series so that we can apply the estimated beta weights into a group-level analysis. 

In the func directory of each subject from BART directory. You can find 3 files end with **events.tsv**. These files contain three pieces of information that we need to create our timing files:

  1 the name of each condition

  2 the onset time of trial for each condtion,relative to the onset of the scan

  3 The duration of each trial


Create the time-series
^^^^^^^^^^^^^^^^^^^^^^

The events.tsv files contains all the information we need, we just need to transfer the format of files so 
that FSL can understand, we will create a timing file for each condition, and then split that file according 
to which run the condition was in:

Timings files for the pump trials that occurred during the first run, second run and third run (which will be 
pump_run1.txt,pump_run2.txt and pump_run3.txt

Timings files for the control trials that occurred during the first run, second run and third run (which will be
control_run1.txt,control_run2.txt and control_run3.txt 

Each of these timing files will have same format consisting of three columns, in the following order:

  1 Onset time, in seconds, relative to the start of the scan;

  2 Duration of the trial, in seconds;

  3 Parametric modulation.

The script
**********

There are 4 different conditions for the BART experiment::

  pump

  control_pump

  explode

  cash out

We only analyze the explode and cast out condition, However, in order to fully seperate each conditions across all the runs, We will use a script to achieve that goal and use the explode and cash out 
conditions only.

Now, go to the directory that contains all the subjes and to create a file with a text editor, copy the script and save it as BART_timing.sh. Here is the script::

  #!/bin/bash

  #Check whether the file subjList.txt exists; if not, create it
  if [ ! -f subjList.txt ]; then
        ls -d sub-?? > subjList.txt
  fi

  #Loop over all subjects and format timing files into FSL format
  for subj in `cat subjList.txt` ; do
        cd $subj/func #Navigate to the subject's func directory, which contains the timing files

        #Extract the onset times for the incongruent and congruent trials for each run. NOTE: This script only extracts the trials in which the subject made a response, you can adjust the script to fit 
        #in the data accordingly
        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="pumps_demean") {print $1, $2, "1"}}' > pump_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="pumps_demean") {print $1, $2, "1"}}' > pump_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="pumps_demean") {print $1, $2, "1"}}' > pump_run3.txt

        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="control_pumps_demean") {print $1, $2, "1"}}' > control_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="control_pumps_demean") {print $1, $2, "1"}}' > control_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="control_pumps_demean") {print $1, $2, "1"}}' > control_run3.txt

        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="explode_demean") {print $1, $2, "1"}}' > explode_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="explode_demean") {print $1, $2, "1"}}' > explode_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="explode_demean") {print $1, $2, "1"}}' > explode_run3.txt

        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="cash_demean") {print $1, $2, "1"}}' > cash_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="cash_demean") {print $1, $2, "1"}}' > cash_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="cash_demean") {print $1, $2, "1"}}' > cash_run3.txt


        cd ../..
  done

After you create the ``BART_timing.sh``, run the script by the command ``bash BART_timing.sh`` and wait for a few seconds, and you can check the results by cd to the func directory within each subject 
directory.


Run the first level analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stats tab
*********

Navigate to the sub-01 directory, and type fsl from the command line. Open the FEAT GUI, and from the dropdown menu in the upper right of the Data tab, change “Full Analysis” to “Statistics”. This will 
grey out the Pre-stats and Registration tabs. You will also see a new button called “Input is a FEAT directory”. Click on the button, and select the FEAT directory run1.feat that you created in the last 
module. Click OK and ignore the warning about loading design information from the design.fsf file; we haven’t set up a model yet, so nothing will be overwritten.


Next, click on the Stats tab. There are many options, but we will only focus on a couple of them. Click on “Full model setup”, and change the Number of original EVs (or Explanatory Variables, FSL’s term 
for regressors) to 2. This will create two tabs, one for each regressor. In the EV name field for regressor 1, type “explode”. Click on the dropdown menu next to Basic shape, and select “Custom (3 
column format)”. This reveals a field called “Filename”; click on the folder icon to select the timing file explode_run1.txt. Uncheck the “Add temporal derivative” button. (This is to make it easier 
to understand the design matrix; we will add the derivatives later.) Click on the “2” tab and repeat these steps, this time selecting the timing file “cash_run1.txt”.

When you have finished setting up the model, click on the ``Contrasts & F-tests tab``. This is where you specify which contrast maps you would like to create after the beta weights for each condition have 
been estimated. In this experiment, we are interested in three contrasts:

1 The average beta weight for the explode condition compared to baseline;

2 The average beta weight for the cash out condition compared to baseline; and

3 The difference of the average beta weights between the explode and cash conditions.


Set the number of contrasts to 3, and type the following contrast names in each row, along with the following contrast weights in the EV1 and EV2 columns:

1 explode [1 0];

2 cash [0 1];

3 explode-cash [1 -1].

Click the Done button, which will open a Design Matrix window. The leftmost column represents the high-pass filter, which removes any frequencies that are longer than the length of the red bar (i.e., low 
frequencies are removed, and higher frequencies are allowed to pass through the filter). The two columns on the right represent the ideal time-series for both regressors, and they correspond to the order 
in which we entered the timing files; in other words, the first column is the ideal time-series for the explode condition, and the second column is the ideal time-series for the cash out condition.

The red line represents what we think the time-series of the voxel should look like if it is responsive to that regressor. You will notice that the white bars represent the HRF that is convolved with the 
onset of each trial for that condition. Take another look at the timing files for each condition and see if the correspondence between the onset times and the design matrix makes sense to you. Then, 
click Go to run the model.

The last tab in the FEAT GUI is called Post-stats. Again, there are many options here, and the only ones you are likely to change are ones labeled “Z threshold” and “Cluster P threshold”, which are the 
thresholds that determine which voxels are statistically significant for each contrast. We will leave these alone for now, and come back to these options when doing a group-level analysis.
