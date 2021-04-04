Running the 1st level analysis
==============================

Previously, we have used **uber_subject.py** to set up the preprocessing for a single subject. You may remember that we removed one of the blocks called “regress”. Now, we will add the regress back and 
combine both preprocessing and 1st-level analysis.Let’s start a new script for the same subject, sub-02. First of all, we need to remove the preprocessed result by typing ``rm -r subject_results`` from 
sub-02 directory. And type ``uber_subject.py`` from the terminal. We will leave "analysis initialization" as the default setting like all the blocks keep as they are.

Let's copy what we did in the preprocessing such as ``fill the name tab``, ``anatomical dataset``, ``EPI dataset``, ``expect options``, ``extra align options``, ``extra tlrc options` . But this time, we need to do more with 3 more sections:

1 stimulus timing files 
2 symbolic GLTs 
3 extra regress options

Stimulus Timing Files
*********************

As we have created the timing files in the last chapter, click the **browse stim** to select the "explode.1D" and "cash.1D" files from sub-02/func.

Symbolic GLTs
*************


Extra Regress Options
*********************
