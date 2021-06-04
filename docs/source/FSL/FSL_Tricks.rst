Change oreintation in FSL
=========================

One of the useful function from FSL is ``fslswapdim``, it can change the orientation of the image. Therefore, you can have the same orentation between T1 and T2 to run the further process.

let’s say you have a T2 image looks like this:

.. image:: FSL_orientation_before.PNG

but the T1 image like this

.. image:: FSL_T1_orientation.PNG

So, you can want to change the orientation so that the T1 and T2 can match, type::

  fslswapdim T2.nii.gz x -z y T2.reorientated.nii.gz

Now, you get the new orientated T2

.. image:: FSL_orientation_after.PNG

Melodic in FSL
^^^^^^^^^^^^^^

ICA analysis

What is the (independent component analysis)ICA analysis? , board speaking, ICA analysis is an signal processing, independent component analysis (ICA) is a computational method for separating a multivariate signal into additive subcomponents. This is done by assuming that the subcomponents are non-Gaussian signals and that they are statistically independent from each other. ICA is a special case of blind source separation. A common example application is the "cocktail party problem" of listening in on one person's speech in a noisy roo
 
