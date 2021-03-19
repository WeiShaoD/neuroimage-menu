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



Run the first level analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stats tab
*********


