USING ITK-SNAP FOR SEGMENTATION
===============================

In this section, we review how to open images for segmentation and set up your workspace

STEP 1: DOWNLOADING ITK-SNAP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, download ITK-SNAP 3.8.0 (click `here <http://www.itksnap.org/pmwiki/pmwiki.php?n=Downloads.SNAP3/>`__ here for download link). It is strongly 
recommended that you install the latest version of ITK-SNAP for segmentation.

STEP 2: OPENING T2-WEIGHTED IMAGES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In ITK-SNAP, select File from the top menu ribbon, then Open Main Image to open the T2 image for one subject. After selecting the file (.nii/.nii.gz), a 
pop-up window will open. Select Next and then Finish to open the T2. You should see four panels, with a sagittal, axial, and coronal view, plus an empty 
panel for 3D rendering.

STEP 3: OPENING T1 IMAGES FOR STRUCTURAL REFERENCE
**************************************************

Next, open the T1 for the same subject as a reference. Select File, then New ITK-Snap Window. In the new window, click File and then Open Main Image to 
select the T1 file (.nii/.nii.gz). If the T1 and T2 are properly co-registered, the scans should automatically align in the same space.

STEP 4: SWITCHING BETWEEN VIEWS
*******************************

Since segmentation is done primarily on the coronal view of the T2-weighted image, you can easily switch between views (coronal, axial, and sagittal) by 
clicking Edit in the top menu ribbon and then Views in the dropdown menu to select Next Display Layout (for shortcuts in ITK-Snap,see `here 
<http://www.itksnap.org/pmwiki/uploads/Documentation/snap_shortcuts_v3.pdf/>__).
