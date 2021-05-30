ROI analysis
============

As we just completed a group-level analysis, and identified some regions of the brain show a significant difference under the condition of the experiment. 
Now, we are going to continue our learning with region of analysis(ROI). This is called a whole-brain or exploratory analysis. When we doesn't have a 
hypothesis to test, these types of studies are beneficial.


While A large number of studies have been run about a specific topic, we can begin to make more specific hypotheses about where we should find our results in 
the brain images. For instance, memory has been studied for many years, and many fMRI studies have been published about it using different paradigms that 
compare differenmt memory tasks. Often, significant increases in the BOLD signal during various memories conditions are seen in a region of the brain known 
as the Hippocampus and medial temporal lobe. For this BART study, then, we could restrict our analysis to this region and only extract data from voxels 
within that region. This is known as a RwO analysis. A general name for an analysis in which we choose to analyze a region selected before look at 
whole-brain results is called a confirmatory analysis.

Whole-brain maps can hide important details about the effects that we’re studying. We may find a significant effect of BART conditions, but the reason the 
effect is significant could be because cash is greater than explode, or because explode is much more negative than cash, or some combination of the two. The 
only way to determine what is driving the effect is with ROI analysis, and this is especially important when dealing with interactions and more sophisticated 
designs.

Atlases
^^^^^^^

First thing firsst, One way to create a region for ROI analysis is to use an ``atlas``, a diagram that divides the brain into anatomically separate sections.

Many atlases are already installed on FSL, and we can access them using the FSL viewer. A new window named Atlases will open if you click on Settings -> 
Ortho View -> Atlas Panel. The Harvard-Oxford Cortical and Subcortical Atlases are loaded by default. By clicking the option next to the atlas name, you can 
see how the atlas divides the brain. A chance of belonging to a brain structure will be assigned to the voxel at the centre of the crosshairs in the viewing 
window.

.. note::

  The Harvard-Oxford Cortical atlas, displayed on an MNI template brain. The Atlas window shows the probability that the voxel is located at a certain 
anatomical region.

To save one of these regions as a file to extract data from, also known as a mask, click on the Show/Hide link next to the region you want to use as a mask - 
in our example, let’s say that we want to use the Paracingulate Gyrus as a mask. Clicking on the link will show that region overlaid on the brain, as well as 
load it as an overlay in the Overlay List window. Click on the disk icon next to the image to save it as a mask. Save it to the Flanker directory and call it 
PCG.nii.

.. note::

  Your results will have the same resolution as the template you used for normalization. The default in FSL is the MNI_152_T1_2mm_brain, which has a 
resolution of 2x2x2mm. When you create a mask, it will have the same resolution as the template that it is overlaid on. When we extract data from the mask, 
the data and the mask need to have the same resolution. To avoid any errors due to different image resolutions, use the same template to create the mask that 
you used to normalize your data.

Extracting Data from an Mask
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Once you’ve created the mask, you can then extract each subject’s contrast estimates from it. Although you may think that we would extract the results from 
the 3rd-level analysis, we actually want the ones from the 2nd-level analysis; the 3rd-level analysis is a single image with a single number at each voxel, 
whereas in an ROI analysis our goal is to extract the contrast estimate for each subject individually.

For the Incongruent-Congruent contrast estimate, for example, you can find each subjects’ data maps in the directory Flanker_2ndLevel.gfeat/cope3.feat/stats. 
The data maps have been calculated several different ways, including t-statistic maps, cope images, and variance images. My preference is to extract data 
from the z-statistic maps, since these data have been converted into a form that is normally distributed and, in my opinion, is easier to plot and to 
interpret.

To make our ROI analysis easier, we will merge all of the z-statistic maps into a single dataset. To do this, we will use a combination of FSL commands and 
Unix commands. Navigate into the Flanker_2ndLevel.gfeat/cope3.feat/stats directory, and then type the following::

  fslmerge -t allZstats.nii.gz `ls zstat* | sort -V`

This will merge all of the z-statistic images into a single dataset along the time dimension (specified with the -t option); this simply means to daisy-chain 
the volumes together into a single larger dataset. The first argument is what the output dataset will be called (allZstats.nii.gz), and the code in backticks 
uses an asterisk wildcard to list each file beginning with “zstat”, and then sorts them numerically from smallest to largest with the -V option

Move the allZstats.nii.gz file up three levels so that it is in the main Flanker directory (i.e., type mv allZstats.nii.gz ../../..). Then use the fslmeants 
command to extract the data from the PCG mask::

  fslmeants -i allZstats.nii.gz -m PCG.nii.gz

This will print 26 numbers, one per subject. Each number is the contrast estimate for that subject averaged across all of the voxels in the mask.

Extracting Data from an Sphere
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You may have noticed that the results from the ROI analysis using the anatomical mask were not significant. This may be because the PCG mask covers a very 
large region; although the PCG is labeled as a single anatomical region, we may be extracting data from several distinct functional regions. Consequently, 
this may not be the best ROI approach to take.

Another technique is called the spherical ROI approach. In this case, a sphere of a given diameter is centered at a triplet of specified x-, y-, and 
z-coordinates. These coordinates are often based on the peak activation of another study that uses the same or a similar experimental design to what you are 
using. This is considered an independent analysis, since the ROI is defined based on a separate study.

The following animation shows the difference between anatomical and spherical ROIs::

.. note::

  To create this ROI, we will need to find peak coordinates from another study; let’s randomly pick a paper, such as Jahn et al., 2016. In the Results 
section, we find that there is a Conflict effect for a Stroop task - a distinct but related experimental design also intended to tap into cognitive control - 
with a peak t-statistic at MNI coordinates 0, 20, 40.

The next few steps are complicated, so pay close attention to each one:

1. Open fsleyes, and load an MNI template. In the fields under the label “Coordinates: MNI152” in the Location window, type 0 20 44. Just to the right of those 
fields, note the corresponding change in the numbers in the fields under Voxel location. In this case, they are 45 73 58. Write down these numbers.

2. In the terminal, navigate to the Flanker directory and type the followi
