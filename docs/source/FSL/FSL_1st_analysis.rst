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
pump_run1.txt,);

Timings files  for the Incongruent trials that occurred during the second run (incongruent_run2.txt);

Timings for the Congruent trials that occurred during the first run (congruent_run1.txt);

Timings for the Congruent trials that occurred during the second run (congruent_run2.txt). 

The script
**********



Run the first level analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stats tab
*********


