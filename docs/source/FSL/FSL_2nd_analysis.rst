2nd level analysis
==================

Once the script have been completed for all the runs of all subjects in the BART dataset. A 2nd-level analysis is ready to run next, in FSL, it would be the averaging together within each subject the 
parameter estimates and contrast estimates from the 1st-level analyses.

Now, ``cd`` to the BART directory, open the FEAT GUI from the command line by typing ``fsl``. Then from the dropdown menu select Higher-Level Analysis. This changes the input field to Select FEAT directories.

Select the FEAT directories
***************************

Due to th 16 subjects with 3 runs each in our dataset, we have 16*3 = 48 FEAT directories in total. Change the Number of inputs to 48, and then click the button Select FEAT directories.

In Data tan, skip ``Inputs are lower-level FEAT directories`` as it is the deafult setting in FSL (the default), click ``Select FEAT directories`` and the ``Paste`` tab, 

Open a new terminal, cd to the BART directory, type::

  ls -d $PWD/sub-??/run*

This will print an absolute path to each FEAT directory. The -d option means to only list directories, and $PWD expands to an absolute path pointing to the current working directory. Within the current 
directory, any directory starting with sub- and ending with two digits (represented by the ? ) is added to the path. Finally, within each subject directory, any directory beginning with the string run 
will be appended to the path name (e.g., run1.feat and run2.feat).

.. image:: FSL_wildcards.png

Use ``Ctrl+c`` and ``Ctrl+y`` to copy and paste the 48 runs.feat into the dashboard.
 
In the Data tab, you will see that there are now 3 lower-level copes that you can choose to analyze. If you leave all three of the boxes selected, it will run a 2nd-level analysis for each one, which 
correspond to:

1 The contrast estimate for the explode condition

2 The contrast estimate for the cash-out condition

3 The contrast estimate for explode vs cash-out
 
In the ``Output directory`` tab, type ``BART_2ndLevel``. This is where the results of the 2nd level analysis will be saved.

Creating the GLM 
****************

The Stats tab will look different from when you used it for 1st-level analysis - you can now choose between different types of models. 

1 Fixed Effects: Do not generalize from the sample - just take the average

2 Mixed Effects: Simple OLS (Ordinary Least Squares): This will perform a t-test on the average parameter estimates calculated for each subject, without taking into account the variability between the runs for each subject

3 Mixed Effects: FLAME 1: Weight each subject’s parameter estimate by the variance of that contrast estimate. In other words, a subject with relatively low variance will be weighted more, and a subject with relatively high variance will be weighted less

4 Mixed Effects: FLAME 1+2: A more rigorous version of FLAME 1. It takes much longer, and is only helpful for analyzing small samples (e.g., 10 subjects or fewer)

For the purpose simplicity, we just take the average of the parameter estimates across the runs within each subject. So, we will use the ``Fixed Effects`` option. select it and go to ``Full Model 
Setup``button.

This will display a window with the number of rows representing the number of individual parameter estimates - in our case, 48. For the Number of main EVs, change this to 16, which is the number of 
subjects in our dataset. Then change the numbers in each column to 1 where you want to take the average for the parameter estimates for that subject. In this case, the first three rows for column 1 would 
be changed to 1, and next three rows for column 2 would be changed to 1, and so on.

.. image:: FSL_2nd_EVs.png 

When you have finished the **EVs**, click on the ``Contrasts & F-tests`` tab, and change the number of ``Contrasts`` to 26. Change all of the numbers on the diagonal to 1. This will create a single contrast 
estimate for each subject that is the average of that subject’s parameter estimates.

.. image:: FSL_2nd_contrast.png

When you have finished setting up the GLM and contrasts and click ``Done``, a design matrix will show up.

