Preprocessing
=========

A good cuisine requires dedicated processes to make the ingredient to be prepared well for the following cooking. There many different preprocessing for neuroimage analysis, but in general, there are 6 major steps are required for the most software packages  

1 Slice correction
^^^^^^^^^^^^^^^^^^

Unlike image we take from the cellphone, an fMRI volume is acquired in slices. Each of these slices takes tens to hundreds of milliseconds.

The two most commonly used methods for creating volumes are sequential and interleaved slice acquisition. 

Sequential slice acquisition acquires each adjacent slice consecutively, either bottom-to-top or top-to-bottom. Interleaved slice acquisition acquires every other slice, and then fills in the gaps on the second pass. Both of these methods are illustrated in the video below.

.. image:: SliceTimingCorrection_Demo.gif

In order to make statistics model work, the time-series for each slice needs to be shifted back in time by the duration it took to acquire that slice.

2 Motion correction
^^^^^^^^^^^^^^^^^^^

If the subject in the scaner is moving, the images will look blurry.If the subject moves a lot, we also risk measuring signal from a voxel that moves. We are then in danger of measuring signal from the voxel from a different region or tissue type. It is the false positive.In addtion, motion can introduce confounds into the imaging data because motion generates signal. If the subject moves every time in response to a stimulus - for example, if he jerks his head every time he feels an electrical shock - then it can become impossible to determine whether the signal we are measuring is in response to the stimulus, or because of the movement.

One way to “undo” these motions is through rigid-body transformations. To illustrate this, pick up a nearby object: a phone or a coffee cup, for example. Place it in front of you and mentally mark where it is. This is the reference point. Then move the object an inch to the left. This is called a translation, which means any movement to the left or right, forward or back, up or down. If you want the object to come back to where it started, you would simply move it an inch to the right.

Similarly, if you rotated the object to the left or right, you could undo that by rotating it an equal amount in the opposite direction. These are called rotations, and like translations, they have three degrees of freedom, or ways that they can move: around the x-axis (also called pitch, or tilting forwards and backwards), around the y-axis (also known as roll, or tilting to the left and right), and around the z-axis (or yaw, as when shaking your head “no”).

We do the same procedure with our volumes. Instead of the reference point we used in the example above, let’s call the first volume in our time-series the reference volume. If at some point during the scan our subject moves his head an inch to the right, we can detect that movement and undo it by moving that volume an inch to the left. The goal is to detect movements in any of the volumes and realign those volumes to the reference volume.

.. image:: MotionCorrectionExample.gif

3 Distortion correction

4 Coregistration
^^^^^^^^^^^^^^^^

Although most people’s brains are similar - everyone has a cingulate gyrus and a corpus callosum, for instance - there are also differences in brain size and shape. As a consequence, if we want to do a group analysis we need to ensure that each voxel for each subject corresponds to the same part of the brain. If we are measuring a voxel in the visual cortex, for example, we would want to make sure that every subject’s visual cortex is in alignment with each other.

Registration 

This alignment between the functional and anatomical images is called Registration. Most registration algorithms use the following steps:

1 Assume that the functional and anatomical images are in roughly the same location. If they are not, align the outlines of the images.

2 Take advantage of the fact that the anatomical and functional images have different contrast weightings - that is, areas where the image is dark on the anatomical image (such as cerebrospinal fluid) will appear bright on the functional image, and vice versa. This is called mutual information. The registration algorithm moves the images around to test different overlays of the anatomical and functional images, matching the bright voxels on one image with the dark voxels of another image, and the dark with the bright, until it finds a match that cannot be improved upon.

3 Once the best match has been found, then the same transformations that were used to warp the anatomical image to the template are applied to the functional images.

5 Normalization
^^^^^^^^^^^^^^^

Just as you would fold clothes to fit them inside of a suitcase, each brain needs to be transformed to have the same size, shape, and dimensions. We do this by normalizing (or warping) to a template. A template is a brain that has standard dimensions and coordinates - standard, because most researchers have agreed to use them when reporting their results.The dimensions and coordinates of the template brain are also referred to as standardized space.

In order to analyze in group level, all of the subjects’ images have been normalized to a template. Although each subjects’ functional images will be transformed to match the general shape and large anatomical features of the template, there will be variations in how smaller anatomical regions align among the normalized functional images. 

.. image:: Registration_Normalization_Demo.gif

6 Smoothing
^^^^^^^^^^^

It is common to smooth the functional data, or replace the signal at each voxel with a weighted average of that voxel’s neighbors. This may seem strange at first - why would we want to make the images blurrier than they already are?

It is true that smoothing does decrease the spatial resolution of your functional data, and we don’t want less resolution. But there are benefits to smoothing as well, and these benefits can outweigh the drawbacks. For example, we know that fMRI data contain a lot of noise, and that the noise is frequently greater than the signal. By averaging over nearby voxels we can cancel out the noise and enhance the signal.

There is another benefit to smoothing. As you will see in the next chapter, our goal is to normalize every subject’s brain to a template brain which has standardized coordinates.

smoothing tends to cancel out noise and enhance signal. This applies to group analyses as well, in which all of the subjects’ images have been normalized to a template. Although each subjects’ functional images will be transformed to match the general shape and large anatomical features of the template, there will be variations in how smaller anatomical regions align among the normalized functional images. If the images are smoothed, there will be more overlap between clusters of signal, and therefore greater likelihood of detecting a significant effect.

..  image:: Smoothing_Demo.gif

