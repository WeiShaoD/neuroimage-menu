FSL oreintation
===============

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
