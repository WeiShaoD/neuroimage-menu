7 Segmenting Subregions of the Entorhinal Cortex
================================================

Segmentation of subregions of the entorhinal cortex (ERC) is accomplished by tracing the posterior-medial ERC (pmERC) from the initial segmentation of the 
complete ERC. The pmERC is traced in **purple**.


ITK-Snap instructions for segmenting ERC into sub-regions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Click the Polygon tool in the Main Toolbar on the left panel of the ITK-SNAP window. Then, in the Segmentation Labels box in the left panel below, choose 
pmERC as your Active label and ERC as your Paint over label. Note you do not need another label called alERC as whatever is not pmERC is alERC. Now you can 
draw a circle around the area of ERC you want to be pmERC and click accept.

Rules for segmenting the ERC into sub-regions 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following rules will help you identify the alERC from the pmERC:
 
 1 When the amygdala is present and the hippocampal head has not appeared yet, ERC is fully covered by alERC (i.e., do not label pmERC).

 2 Approximately 2 mm after the appearance of the hippocampal head, draw the superior boundary of the pmERC to match the superior boundary of the ERC. The inferior boundary of the pmERC is at the uncal notch (see **Helpful Additional Resources for Further Reading**, Maass et al., 2015). This rule assumes that the hippocampus is still “enclosed” in white matter (i.e., the head looks like a digitized bean or “lazy boy” shape).

    In the case that the pmERC starts on a slice where the uncal notch has not yet appeared (i.e., in cases where the hippocampal head starts before the 
    limen insulae/FTJ), draw pmERC to the medial ¼ of the ERC (see Variability in Landmarks section for more information about this case).
 
 3 Moving posteriorly (in subsequent slices), when the hippocampal sulcus is present, and lower bank of the anterior head (i.e. subiculum, which does not yet get its own label) is contiguous with ERC, draw the inferior pmERC boundary halfway between width of previous slice and next slice. Note that the  hippocampal subfields are not yet segmented on this slice of MTL. More specifically, draw the inferior boundary of pmERC up to about an average midway point from how far up it was drawn in the previous slice and how far up it will be drawn on the subsequent slice.

 4 Moving more posteriorly, the pmERC covers ⅓ of ERC when the first slice of DG appears.

 5 Next, draw pmERC covering ½ of ERC at the hippocampal slice that is 2/3 away from the start of the hippocampal head to the last slice of the ERC. 

 6 For the last slice that contains uncus (i.e. last slice of hippocampal head), ERC is covered by ¾ pmERC. To review terminology of the hippocampus(e.g.,hippocampal head), see **Figure 4.14 in Lay of the Land: Medial Temporal Lobe Landmarks**.

 7 In the final slice where no uncus is present, ERC is fully covered by pmERC.
