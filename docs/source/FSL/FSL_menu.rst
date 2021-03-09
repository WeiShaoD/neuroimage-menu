FSL
===

Welcome to the FSL
^^^^^^^^^^^^^^^^^^

FSL (The FMRIB Software) is a comprehensive library of analysis tools for fMRI, MRI and DTI brain imaging data. It runs on Apple and PCs (both Linux, and Windows via a Virtual Machine),  Most of the tools can be run both from the command line and as GUIs ("point-and-click" graphical user interfaces)

Now go to `FSL <https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/>`_ find the right version of FSL to dowload and install  

.. image:: FSL_install.PNG

.. image:: FSL_install2.PNG


One of the useful function from FSL is fslswapdim, it can change the orientation of image. Therefore, you can have the same orentation to process

For example, let's say you have a T2 image looks like this: 

.. image:: FSL_orientation_before.PNG

but the T1 image is this

.. image:: FSL_T1_orientation.PNG

So, you can want to change the orientation so that the T1 and T2 can match, type::

fslswapdim T2.nii.gz x -z y T2.reorientated.nii.gz

Now, you get the new orientated T2.

.. image:: FSL_orientation_after.PNG 

