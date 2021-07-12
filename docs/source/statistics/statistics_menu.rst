Statistics for neuroimage
=========================

Power statistics 
^^^^^^^^^^^^^^^^

Power analysis is directly related to tests of hypotheses. While we conducting tests based on different hypotheses, there are two types of errors researchers 
can make: Type I error and Type II error. Statistical power mainly deals with Type II errors.In general, it is worth to note that the higher the sample size, 
the easier it will be to obtain the 0.05 level of significance. However, if the sample size is too small, the investigator may make a Type II error due to 
insufficient power.

Data collection is usually preceded by a power analysis. The principal goal of power analysis is to assist researchers in determining the minimum sample size 
necessary to detect the effect of a given test at the desired level of significance. The reason for doing power analysis is that we would prefer a lower 
sample size because larger samples are frequently more expensive. The significance testing is also improved with smaller samples.

Multivariate data 
^^^^^^^^^^^^^^^^^

Multivariate data contains, at each sample point, multiple scalar values that represent different simulated or measured quantities. Multivariate data can 
come from numerical simulations that calculate a list of quantities at each time step, or from medical scanning modalities such as MRI, which can measure a 
variety of tissue characteristics, or from a combination of different scanning modalities, such as MRI, CT, and PET. Multidimensional transfer functions are 
an obvious choice for volume visualization of multivariate data, since we can assign different data values to the different axes of the transfer function. It 
is often the case that a feature of interest in these datasets cannot be properly classified using any single variable by itself. In addition, we can compute 
a kind of first derivative in the multivariate data in order to create more information about local structure. As with scalar data, the use of a first 
derivative measure as one axis of the multi-dimensional transfer function can increase the specificity with which we can isolate and visualize different 
features in the data.

One example of data that benefits from multi-dimensional transfer functions is volumetric color data. A number of volumetric color datasets are available, 
such as the Visible Human Project's RGB data. The process of acquiring color data by cryosection is becoming common for the investigation of anatomy and 
histology. In these datasets, the differences in materials are expressed by their unique spectral signatures. A multidimensional transfer function is a 
natural choice for visualizing this type of data. Opacity can be assigned to different positions in the 3D RGB color space.

mean squared error
^^^^^^^^^^^^^^^^^^

let's compute the mean squared error for a set of inputs x, measurements y, and slope estimate θ^. Here, x and y are vectors of data points. We will then 
compute and print the mean squared error for 3 different choices of theta.

As a reminder, the equation for computing the estimated y for a single data point is:

y^i=θxi

and for mean squared error is:

minθ1N∑i=1N(yi−y^i)2
