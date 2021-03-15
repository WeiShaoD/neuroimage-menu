preprocessing
=============


Preprocessing is the first step to do a fMRI analysis

Skull stripping
^^^^^^^^^^^^^^^

looking at the data
*******************


FSL provided a function that can help you skullstripping 

1 open fsl gui by type `fsl`


In the Search window, there are three options: 1) No search; 2) Normal search; and 3) Full search. This signifies to FSL how much to search for a good initial alignment between the functional and anatomical images (for registration) and between the anatomical and template images (for normalization). The Full search option takes longer, but is more thorough and therefore more likely to produce better registration and normalization.


Although the script can help you to run all the 34 subjects, But it is recommended to run subjects one by one so you can familair all the processes 


Motion Correcation
******************

Slice-Timing Correction
***********************

Smoothing
^^^^^^^^^

Registration and Normalization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Check the Preprocessed Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^






