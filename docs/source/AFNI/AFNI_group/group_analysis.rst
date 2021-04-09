group_analysis
==============

Our goal in analyzing this dataset is to generalize the results to the population that the sample was drawn from. In other words, if we see changes in brain activity in our sample, can we say that these 
changes would likely be seen in the population as well?

To test this, we will run a group-level analysis (also known as a second-level analysis). In AFNI, this means that we calculate the standard error and the mean for a contrast estimate, and then test 
whether the average estimate is statistically significant. We will be doing this group-level analysis in two ways: Using 3dttest, which uses only the contrast estimates in testing for statistical 
significance; and using 3dMEMA, which accounts for both the difference between the parameter estimates, and the variability of that contrast.

uber_ttest.py
^^^^^^^^^^^^^
