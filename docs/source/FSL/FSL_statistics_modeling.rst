Statistics and modeling
================

After we finish all the preprocessing steps, we can go to the next - fit a model to the data. For a bettwe understanding of model fitting, we need to review some 3 fundamental components; 

  1 General Linear Model 

  2 The BOLD response 

  3 Time-series 

Overview picture
^^^^^^^^^^^^^^


General linear model
^^^^^^^^^^^^^^^^^^^^

In General Linear Model, or GLM. we can use one or more regressors - independent variables, to fit a model for some outcome measure - or dependent variable. To do this we compute numbers called beta weights, which are the relative weights assigned to each regressor in oder to get the best fitting for the data. Any discrepancies between the model and the data are called residuals.

.. image:: FSL_GLM_Equation.png

The symbols representing each of these terms are shown in the equation, which can be shortened or expanded depending on the number of regressors in your model


For example, imagine that we want to predict the chance of infecting Covid-19 based on social distance, daily interaction in person, and longitude. It is reasonable to find that social distanc has a negative correlation with the infection of Covid-19, the more distance you keep with other people, the less chance you will get Covid-19. In terms of daily interaction in person, it has a positive association, the more you interact with people in person, you are mor likely to be effected by the virvus. longitude has no association at all. 

Therefore, we need assign each of these regressors a beta weight so that the model can fit the data best. To be more specific, maybe each additional meter for social distance is associated with an additional 0.5 decrease in infection of Covid-19, while each additional 0.5 daily is associated with a 0.3 increase::

  Chance of infecting Covid-19 (Y) = -0.5X1(social distance) + 0.3X2(personal inteaction) + ε 

This GLM can be expanded to include many regressors, but however many there are, the GLM assumes that the data can be modeled as a linear combination of each of the regressors.


BOLD response
^^^^^^^^^^^^^

BOLD signal
***********

In 1990, a researcher at Bell Laboratories named Seiji Ogawa discovered that more deoxygenated blood leads to a decrease in the signal measured from a brain region. An increase in oxygenated blood, on the other hand, increases the signal -  this increase in oxygenated blood was later shown to be correlated with increased neural firing. This change in signal is known as blood oxygen level dependent signal ( BOLD signal). Shortly afterwards, a researcher at Massachusetts General Hospital named Ken Kwong in 1992 demonstrated that the BOLD signal could be used as an indirect measure of neural activity. His experiment consisted of alternately showing a flashing checkerboard and a black screen to the subject for one minute each. The BOLD signal was recorded during each condition, as shown in the following video:

.. image:: Kwong_fMRI_Video.gif

In the 1990’s, empirical studies of the BOLD signal demonstrated that, after a stimulus was presented to the subject, any part of the brain responsive to that stimulus - say, the visual cortex in 
response to a visual stimulus - showed an increase in BOLD signal. The BOLD signal also appeared to follow a consistent shape, peaking around six seconds and then falling back to baseline over the next 
several seconds. This shape can be modeled with a mathematical function called a Gamma Distribution. As Gamma Distribution is created with parameters to best fit the BOLD response observed by the 
these empirical studies, it is the canonical Hemodynamic Response Function(HRF).

Time series
^^^^^^^^^^^

To understanding how model fitting works, first we need to review the composition of fMRI data. Remember that fMRI datasets contain several volumes strung together like beads on a string - we call this 
concatenated string of volumes a run of data. The signal that is measured at each voxel across the entire run is called a time-series.



Although the script can help you to run all the 34 subjects, But it is recommended to run subjects one by one so you can familair all the processes
