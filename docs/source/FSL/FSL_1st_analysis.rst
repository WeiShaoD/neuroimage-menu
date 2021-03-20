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

There are 4 different conditions for the BART experiment: 

pump

control_pump

explode

cash out

We only analyze the explode and cast out condition, However, in order to fully seperate each conditions across all the runs, We will use a script to achieve that goal and use the explode and cash out 
conditions only.

Here is the script::

  #!/bin/bash

  #Check whether the file subjList.txt exists; if not, create it
  if [ ! -f subjList.txt ]; then
        ls -d sub-?? > subjList.txt
  fi

  #Loop over all subjects and format timing files into FSL format
  for subj in `cat subjList.txt` ; do
        cd $subj/func #Navigate to the subject's func directory, which contains the timing files

        #Extract the onset times for the incongruent and congruent trials for each run. NOTE: This script only extracts the trials in which the subject made a correct response. Accuracy is near$
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


Run the first level analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stats tab
*********


