Running fMRI with python
========================

This chapter we are going to have more fun as we can get rid of the neuroimage tool and use python to run the fMRI analysis

HCP dataset and Gamblining project
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

HCP
***
The Human Connectome Project (HCP) is a data sharing initiative to address fundamental questions about human anatomy and variation related to neuron 
connectivity. It is based at Washington University and includes collaborations between University of Southern California, Harvard and Massachusetts General 
Hospital.The HCP collected scanned the brains of more than 1200 young men and women, mostly in their 20s, participants also completed questionnaires about 
their health and lives, an aerobic fitness walking test and cognitive tests.

The HCP dataset comprises task-based fMRI from a large sample of human subjects. The dataset includes time series data that has been preprocessed and 
spatially-downsampled by aggregating within 360 regions of interest. In order to use this dataset, please electronically sign the HCP data use terms at 
`ConnectomeDB <https://db.humanconnectome.org/app/template/Login.vm>`__. Although We are only use the gambling sub dataset for this chapter, you can apply 
the code with different dataset once you learned the code.
 
Instructions for this dataset are on pp. 24-25,36 and 50-51 of the `HcP Reference Manual 
<https://www.humanconnectome.org/storage/app/media/documentation/s1200/HCP_S1200_Release_Reference_Manual.pdf>`__. you are more than welcome to study this 
manual before the analysis

Gambling project
****************

This task was adapted from the one developed by Delgado and Fiez (`Delgado et al. 2000 
<https://journals.physiology.org/doi/full/10.1152/jn.2000.84.6.3072>`__). Participants play a card guessing game where they are asked to guess the number 
on a mystery card (represented by a “?”) in order to win or lose money. Participants are told that potential card numbers range from 1-9 and to indicate if 
they think the mystery card number is more or less than 5 by pressing one of two buttons on the response box. Feedback is the number on the card (generated 
by the program as a function of whether the trial was a reward, loss or neutral trial) and either: 1) a green up arrow with “$1” for reward trials, 2) a 
red down arrow next to -$0.50 for loss trials; or 3) the number 5 and a gray double headed arrow for neutral trials. The “?” is presented for up to 1500 ms 
(if the participant responds before 1500 ms, a fixation cross is displayed for the remaining time), following by feedback for 1000 ms. There is a 1000 ms 
with a “+” presented on the screen. The task is presented in blocks of 8 trials that are either mostly reward (6 reward trials pseudo randomly interleaved 
with either 1 neutral and 1 loss trial, 2 neutral trials, or 2 loss trials) or mostly loss (6 loss trials pseudorandomly interleaved with either 1 neutral 
and 1 reward trial, 2 neutral trials, or 2 reward trials). In each of the two runs, there are 2 mostly reward and 2 mostly loss blocks, interleaved with 4 
fixation blocks (15 seconds each).


Running the analysis
^^^^^^^^^^^^^^^^^^^^
Once you are faniliar with the dataset, we can start with loading the libraries::

  import os
  
  import numpy as np
  
  import matplotlib.pyplot as plt

Next, let setting the figure::

 #title Figure settings
 
 %matplotlib inline

 %config InlineBackend.figure_format = 'retina'
  
 plt.style.use("https://raw.githubusercontent.com/NeuromatchAcademy/course-content/master/nma.mplstyle")

Once we set up the figure, downloading the data would be the next::

  # The download cells will store the data in nested directories starting here:
  HCP_DIR = "./hcp"
  if not os.path.isdir(HCP_DIR):
  os.mkdir(HCP_DIR)

  # The data shared for NMA projects is a subset of the full HCP dataset
  N_SUBJECTS = 339

  # The data have already been aggregated into ROIs from the Glasser parcellation
  N_PARCELS = 360

  # The acquisition parameters for all tasks were identical
  TR = 0.72  # Time resolution, in seconds

  # The parcels are matched across hemispheres with the same order
  HEMIS = ["Right", "Left"]

  # Each experiment was repeated twice in each subject
  N_RUNS = 2

  # There are 7 tasks in the dataset. Each has a number of 'conditions'. and we are only use the gambling data

  EXPERIMENTS = {
      'GAMBLING'   : {'runs': [11,12], 'cond':['loss','win','neut']}
  }

  # You may want to limit the subjects used during code development.
  # This will use all subjects:
  subjects = range(N_SUBJECTS)
