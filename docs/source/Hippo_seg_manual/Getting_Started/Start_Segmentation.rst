1 Getting Started
=================

GETTING STARTED WITH SEGMENTATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this section, we will start off by surveying the goals of medial temporal lobe segmentation and introducing the necessary tools for manual segmentation.

GOALS OF SEGMENTATION
^^^^^^^^^^^^^^^^^^^^^

The medial temporal lobes (MTL) are composed of several regions of interest (ROI) for perception and memory research, including the rhinal cortex, 
hippocampus, and parahippocampal cortex. To understand the relationship between grey matter volume in these MTL regions and specific cognitive processes, 
we need to determine the boundaries of these regions. This is achieved through the manual segmentation, or tracing, of MTL regions. Here, we will introduce 
segmentation based on the Olsen-Amaral-Palombo (OAP) protocol.

TOOLS REQUIRED FOR SEGMENTATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITK-SNAP (Yushkevich et al., 2006) is used as the primary segmentation software in this guide. We use version 3.8.0 in this guide (download link `here 
<http://www.itksnap.org/pmwiki/pmwiki.php/>`__).

We recommend using a drawing pad, tablet or a stylus pen for segmentation. A mouse can also be used, however. You can use this `pad 
<https://www.amazon.com/dp/B07BGXRXMB/ref=sspa_dk_detail_3?psc=1&pd_rd_i=B07BGXRXMB&pd_rd_w=sjQTL&pf_rd_p=8a8f3917-7900-4ce8-ad90-adf0d53c0985&pd_rd_wg=bj2JB&pf_rd_r=P12R4JBT09JZT7KKR6TB&pd_rd_r=8fc0c02f-9117-11e9-b208-bf1295e13c3c/>`__.

Anatomical plane is used for segmentation
*****************************************

Segmentation is done on the coronal view, which allows for the best visualization of the ROIs. The axial and sagittal views are useful when differentiating 
between sulci in the brain.

scan to do segment under this protocol
**************************************

The OAP protocol segments on T2-weighted images. T1 scans are used for anatomical reference and should be co-registered for alignment prior to starting 
segmentation. To learn more about high-resolution co-registration, we recommend this `tutorial 
<https://layerfmri.com/2019/02/11/high-quality-registration/>`__, which uses ANTs registration (Advanced Normalization Tools; to learn more see `here 
<https://github.com/ANTsX/ANTs/wiki/Anatomy-of-an-antsRegistration-call/>`__)

Other tools needed for segmentation
***********************************

You will also need a spreadsheet file for segmentation notes. This will include all your ROIs for each subject along with helpful notes about landmarks in 
the brain.

