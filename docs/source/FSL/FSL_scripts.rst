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
 
Adding the scirpt 
**************

Once you create the template design file, what we need to do next is to copy this file into all 16 subjects directory, adjust the setting accordingly, and excute the command with FSL.

Here is the script you need to copy and save it as **prepro_model.sh** in your BART directory::

  #!/bin/bash

  # Generate the subject list to make modifying this script
  for id in `seq -w 1 16` ; do
      subj="sub-$id"
      echo "===> Starting processing of $subj"
      echo
      cd $subj
        
        # If the brain mask doesn’t exist, create it
        if [ ! -f anat/${subj}_T1w_brain.nii.gz ]; then
            echo "Skull-stripped brain not found, using bet with a fractional intensity threshold of 0.35"
            bet2 anat/${subj}_T1w.nii.gz \
                anat/${subj}_T1w_brain_f02.nii.gz -f 0.35
        fi

        # Copy the design files into the all the subject directory, and change “sub-01” content of original design files to different subject accordingly
        cp ../design_run1.fsf .
        cp ../design_run2.fsf .
        cp ../design_run3.fsf .  

        # Change “sub-01” content of original design files to match different subjects accordingly 
        sed -i "s|sub-01|${subj}|g" design_run1.fsf
        sed -i "s|sub-01|${subj}|g" design_run2.fsf
        sed -i "s|sub-01|${subj}|g" design_run3.fsf
  
        # Now everything is set up to run feat
        echo "===> Starting feat for run 1"
        feat design_run1.fsf
        echo "===> Starting feat for run 2"
        feat design_run2.fsf
        echo "===> Starting feat for run 2"
        feat design_run3.fsf
                echo

    # Go back to the directory containing all of the subjects, and repeat the loop
    cd ..
  done

  echo "job is done"

After everyhing is seted, type ``bash prepro_model.sh`` to run the script and take a break, Have fun!

.. image:: FSL_bash_script.png 

The script will loop over all of the 16 subjects in the BART dataset and do the preprocessing and statistical modelling for each run. The time should take around 1-2 hours. Be sure to do quality checks 
for each subject just as you did before..
