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

One way to create a region for our ROI analysis is to use an atlas, or a map that partitions the brain into anatomically distinct regions.

Many atlases are already installed on FSL, and we can access them by using the FSL viewer. Open FSL view from FSL_gui and click file -> Open standard -> choose MNI standard space such as MNI152_T1_2mm_brain.nii.gz A new window, right click  named ``Atlases`` will open if you click on Settings -> 
Ortho View 1 -> Atlas Panel. The Harvard-Oxford Cortical and Subcortical Atlases are loaded by default. By clicking the Show/Hide option next to the atlas 
name, you can see how the atlas divides the brain. A chance of belonging to a brain structure will be assigned to the voxel at the centre of the crosshairs 
in the viewing window.

What we need do 


Extract the data
^^^^^^^^^^^^^^^^

Now, we need to extract the data from the mask we just created. First thing first.
