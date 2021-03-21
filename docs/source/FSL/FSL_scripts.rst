Script
======

Here is the script that can help that can you finish all propressing steps 

Creat a design file
*******************

When you analyzed the run_1 of sub-01 manually, a directory called run1.feat was created. There are many files and sub-directories within that directory. One of these files, **design.fsf**, contains all of 
the code information that transfered from the FEAT GUI into a text file. And the code in here includes all the preprocessing and modeling steps created by FSL. If you open up the design.fsf file in a 
text editor. You can see all the steps and data in which you used FEAT GUI created before.

.. image:: FSL_design_fsf.PNG

Now, recall all the steps from you long-term memory system because we need to create a design.fsf for all the steps from preprocessing and 1st level analysis we did before to create a template design.fsf 
file.

First thing first, you need to ``cd`` to ``sub-01`` and rm all the **....feat** files. And reopen FSL GUI by type fsl from the sub-01 directory. Click ``FEAT FMRI analysis``, we will creat a **full 
analysis** file:
 
1 select ``Full Analysis``. Start from Data tab, use ``Select 4D data`` to fill the input bold.nii.gz file 

2 select the right brainskull stripping anat image and standard space to finish the **Registration** task

3 go to the **Stats** tab and click the **Full model setup** to repeat the 1st analysis steps we did

After you finish all the steps, instead of clicking ``Go``, click the ``Save`` button and name your file as **design_run1**

.. image:: FSL_design_file.PNG 

 
Add the scirpt 
**************
The next step is to use the 

#!/bin/bash

# Generate the subject list to make modifying this script
# to run just a subset of subjects easier.

for id in `seq -w 1 26` ; do
    subj="sub-$id"
    echo "===> Starting processing of $subj"
    echo
    cd $subj
        
        # If the brain mask doesn’t exist, create it
        if [ ! -f anat/${subj}_T1w_brain_f02.nii.gz ]; then
            echo "Skull-stripped brain not found, using bet with a fractional intensity threshold of 0.2"
            # Note: This fractional intensity appears to work well for most of the subjects in the
            # Flanker dataset. You may want to change it if you modify this script for your own study.
            bet2 anat/${subj}_T1w.nii.gz \
                anat/${subj}_T1w_brain_f02.nii.gz -f 0.2
        fi

        # Copy the design files into the subject directory, and then
        # change “sub-08” to the current subject number
        cp ../design_run1.fsf .
        cp ../design_run2.fsf .

        # Note that we are using the | character to delimit the patterns
        # instead of the usual / character because there are / characters
        # in the pattern.
        sed -i '' "s|sub-08|${subj}|g" \
            design_run1.fsf
        sed -i '' "s|sub-08|${subj}|g" \
            design_run2.fsf

        # Now everything is set up to run feat
        echo "===> Starting feat for run 1"
        feat design_run1.fsf
        echo "===> Starting feat for run 2"
        feat design_run2.fsf
                echo

    # Go back to the directory containing all of the subjects, and repeat the loop
    cd ..
done

echo
