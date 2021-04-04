Running the 1st level analysis
==============================

Previously, we have used **uber_subject.py** to set up the preprocessing for a single subject. You may remember that we removed one of the blocks called “regress”. Now, we will add the regress block back 
and combine both preprocessing and 1st-level analysis into a single script.Let’s start a new script for the same subject, sub-02. First, we need to remove the preprocessed result by typing ``rm -r 
subject_results`` from sub-02 directory. Type uber_subject.py from the terminal and restart it. We will leave "analysis initialization" as the default setting like all the blocks keep as they are.
