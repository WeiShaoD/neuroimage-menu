9 Computing Volumes and Statistics 
==================================

Once you have a segmentation, it is important to get some information about it. For this, there is a volumes and statistics option in ITK-Snap that allows 
you to see the volume corresponding to each label in your segmentation as well as intensity statistics for each label.

STEP 1
^^^^^^

Open image and corresponding segmentation.

STEP 2
^^^^^^

In the task bar, select **Segmentation -> Volumes & Statistics** 

Here, you will see information about:

 ​​Number of voxels that belong to the structure
 
 Volume of the structure (in cubic millimeters)
 
 Mean image intensity inside the structure
 
 Standard deviation of the image intensity in the structure

STEP 3
^^^^^^

Select **Export** and specify a filename with **a .txt** extension and click OK.

STEP 4
^^^^^^

Import text file into a spreadsheet application for analysis. For analysis, it is important to note that you cannot use raw structural volumes in your 
models. This is because you need to account for total estimated intracranial volume (ICV).

To do this, refer to the methodology section of Raz et al. (2015). You may correct for ICV via a linear equation: Volumeadj = Volumerawi - b(ICVi - Mean 
ICV), where Volumeadj is the adjusted regional volume, Volumerawi is the original volume for an individual, b is the slope of the ROI volume regressed on 
ICV, and Mean ICV is the sample mean of ICV (Raz et al., 2015).
