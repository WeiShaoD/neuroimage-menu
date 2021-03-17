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


For example, imagine that we want to predict the chance of infecting Covid-19 based on frequency of mask-wearing, work environment and hours of watch TV per week. It is reasonable to find that mask-wearing has a negative correlation with Covid-19, the more you wear a mask, the less chance you will get Covid-19, work envirnment also has a negative association, the better environment, the less Covid-19 and watch TV hours has no association at all. and we assign each of these regressors beta weights to best fit the data. For example, maybe each additional time for wearing a mask is associated with an additional 0.5 decrease in infection of Covid-19, while each additional better work environment is associated with a 0.07 decrease     


This GLM can be expanded to include many regressors, but however many there are, the GLM assumes that the data can be modeled as a linear combination of each of the regressors - hence the name General Linear Model. We will see how to apply the GLM to fMRI data in the next chapter

BOLD response
^^^^^^^^^^^^

Time series
^^^^^^^^^^^




Although the script can help you to run all the 34 subjects, But it is recommended to run subjects one by one so you can familair all the processes 
