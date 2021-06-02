ROI analysis
============

As we just completed a group-level analysis, and identified some regions of the brain show a significant difference under the condition of the experiment.
Now, we are going to continue our learning with region of analysis(ROI). This is called a whole-brain or exploratory analysis. When we doesn't have a
hypothesis to test, these types of studies are beneficial.

While A large number of studies have been run about a specific topic, we can begin to make more specific hypotheses about where we should find our results in
the brain images. For instance, memory has been studied for many years, and many fMRI studies have been published about it using different paradigms that
compare differenmt memory tasks. Often, significant increases in the BOLD signal during various memories conditions are seen in a region of the brain known
as the Hippocampus and medial temporal lobe. For this BART study, then, we could restrict our analysis to this region and only extract data from voxels
within that region. This is known as a ROI analysis. A general name for an analysis in which we choose to analyze a region selected before look at
whole-brain results is called a confirmatory analysis.

Whole-brain maps can hide important details about the effects that we’re studying. We may find a significant effect of BART conditions, but the reason the
effect is significant could be because cash is greater than explode, or because explode is much more negative than cash, or some combination of the two. The
only way to determine what is driving the effect is with ROI analysis, and this is especially important when dealing with interactions and more sophisticated
designs.

Atlas
^^^^^

One way to do an ROI analysis is to use an atlas, a map that partitions the brain into anatomically distinct regions.

AFNI has a number of atlases in both ``Talairach`` and ``MNI space`` that may be accessed via the AFNI GUI. It may be difficult for the beginner to locate 
the atlases; select the ``anat_final.sub-01`` as underlay, then, you must first click on ``Define Datamode``, then ``Plugins``, and then ``Draw Dataset`` 
from the dropdown menu. the procedure is depicated in the picture below.

.. image:: Selection

As you can see, open the ``Draw Dataset``window and click the button ``Choose dataset for copying``. We have one way to do it since all of our data has been 
normalised to the MNI avg152T1 template: Select one of the normalized anatomical images from the BART_afni dataset.

Like painter need to drawing on a whiteboard. The The goal of copying that dataset is to generate a "clean" dataset with the same dimensions as the other 
images, but one that we can write on by designating which voxels correspond to our ROI. In this case, open the AFNI GUI from ``sub-01/sub-01.results`` 
and select the ``Draw Dataset`` window from the ``sub-01/sub-01.results directory``. Select the file ``sub-01/sub-01.results/anat_final.sub-01+tlrc``.

Next,select the atlas ``DD Desai MPM`` from the AFNI_GUI, then click the dropdown option underneath it. You can choose from a variety of regions, and the 
voxels indicated by each label can usually be deduced from the name.

After selecting left hippocampus and right hippocampus, click the Load: InFill button. All of the voxels in that atlas region will be highlighted in red, and 
then ``SaveAs``. The hippo_mask output is what you should call it. This will generate a new file with values of “1” in the region's voxels and zeros 
everywhere else; this is referred to as a mask. Click ``Done`` once you've completed.

.. note::

  The results dataset in AFNI has a different resolution than the normalised anatomical image and the template used for normalisation by default. Our AFNI 
template was the MNI avg152T1+tlrc file, which has a resolution of 2x2x2mm, whereas our statistics dataset has a resolution of 3x3x3mm. To use a mask for a 
ROI analysis, it must have the same resolution as the dataset from which it is being extracted.

We can match the resolutions of our mask dataset and our statistics dataset by using AFNI’s ``3dresample`` command. This command requires both a “master” 
dataset, which we will be resampling to, and an “input” dataset, which will have its dimensions and resolution changed to match the master datset::

  3dresample -master stats.sub-01+tlrc -input hippo_mask+tlrc -prefix hippo_mask_rs+tlrc

This will create a new file, hippo_mask_rs (rs stands for re-sampled). Move this mask to our data subject directory by typing ``mv hippo_mask_rs+tlrc* 
../../`` We can then use it to extract data for our ROI analysis.

Extracting the data from mask
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After we generated the mask, we can use it to extract the contrast estimates for each subject. We can extract our contrast of interest of cash-explode in one 
ways: Extract the individual beta weights for cash and explode separately, and then take the difference between the two.

This method allows us to figure out what is causing the effect; for example, a significant effect might be caused by both beta weights being positive but the 
cash betas being more positive,or both weights being negative but the explode betas being more negative, or a mix of the two. This can only be determined by 
extracting both sets of beta weights.

From the subjects directory type::

  3dinfo -verb sub-01/sub-01.results/stats.sub-01+tlrc.

The sub-briks indicate which volume in the dataset has which beta weight. In this example, the cash condition's beta weight is sub-brik 1, the explode 
condition's beta weight is sub-brik 4, and the contrast weight for cash-explode is sub-brik 7. Sub-briks 1 and 4 will be extracted and saved in separate 
files, and the values for each subject will be extracted from a ROI.


To extract the individual sub-briks::

  #!/bin/bash

  for subj in `cat subjList.txt`; do

          3dbucket -aglueto Cash_betas+tlrc.HEAD ${subj}/${subj}.results/stats.${subj}+tlrc'[1]'
          3dbucket -aglueto Explode_betas+tlrc.HEAD ${subj}/${subj}.results/stats.${subj}+tlrc'[4]'

  done


When it finishes, you will have generated two new datasets: Cash_betas and Explode_betas.You can now extract data from the anatomical mask by using 
the 3dmaskave command::

  3dmaskave -quiet -mask hippo_mask_rs+tlrc Cash_betas+tlrc

And the same command for the explode betas as well::

 3dmaskave -quiet -mask hippo_mask_rs+tlrc Explode_betas+tlrc

This command returns a number that corresponds to the contrast estimate used in the analysis. The first value, for example, corresponds to the average 
contrast estimate for cash-explode for sub-01, the second number, for sub-02, and so on. After that, you may use statistics software like R to do a t-test on 
them.
