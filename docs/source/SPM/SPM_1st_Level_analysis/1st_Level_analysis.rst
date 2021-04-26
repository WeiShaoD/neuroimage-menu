First level analysis in SPM
===========================

Specifying the Model
^^^^^^^^^^^^^^^^^^^^

.. image:: estimate.PNG

.. image:: model_design.PNG

.. image:: Specifying_model.PNG 

.. image:: Contrast.PNG

.. image:: contrast_2.PNG

Having created the timing files in the previous chapter, we can use them in conjunction with our imaging data to create statistical parametric maps. These maps indicate the strength of the correlation 
between our ideal time-series (which consists of our onset times convolved with the HRF) and the time-series that we collected during the experiment. The amount of modulation of the HRF is represented by 
a beta weight, and this in turn is converted into a t-statistic when we create contrasts using the SPM contrast manager.

To begin, from the SPM GUI click on Specify 1st-Level. Note that the first field that needs to be filled in is the Directory field. To keep our results organized, go to the Matlab terminal, navigate to 
the sub-08 directory, and type mkdir 1stLevel. Then double-click on Directory and select the 1stLevel directory you just created. All of the output of the 1st-level analysis will go into this folder.

Next, we will fill in the Timing parameters section. Under Units for design, select Seconds, and enter a value of 2 for Interscan Interval. Then click on Data & Design, and click twice on New: 
Subject/Session to create two new sessions. For the Scans of the first session, go to the func directory and use the Filter and Frames fields to select all 146 volumes of the warped functional data 
(i.e., those files beginning with swar). Do the same for the volumes in the second session.

Go back to the field for the first session. There are two conditions in the experiment, and both conditions occur in each run. Click on Conditions and then New: Condition twice to create two new 
Condition fields. For the first condition, double-click on Name and type Inc.

We will now need the onset times for each occurrence of the Incongruent condition. From the Matlab terminal, navigate to the func directory and type:

IncRun1 = importdata('incongruent_run1.txt');
IncRun1(:,1)

Which will return the onset times for the Incongruent condition of run 1. Double-click on the Onsets field, and copy and paste the onset times into the window. Click Done.

In this experiment each trial lasted for 2 seconds. We can therefore enter the number 2 in the Durations field, and SPM will assume that it is the same duration for every trial.

Now do the same procedure for the Congruent condition for run 1, and the Incongruent and Congruent conditions for run 2, remembering to enter a duration value of 2 for all of them. Here is the code to 
display the onset times for each of the remaining onset times that you will need:

ConRun1 = importdata('congruent_run1.txt');
ConRun1(:,1)
IncRun2 = importdata('incongruent_run2.txt');
IncRun2(:,1)
ConRun2 = importdata('congruent_run2.txt');
ConRun2(:,1)

You can use the names “Inc” and “Con” for both runs if you want; the names will be stored in a file called SPM.mat which we will look at later in more detail.

When you are done, click the green Go button. The model estimation should only take a few moments. When it is finished, you should see something like this:

The General Linear Model for a single subject. The first two columns shows the ideal time-series for the Incongruent and Congruent conditions for the first session, while the next two show the ideal 
time-series for the conditions of run 2. The last two columns are basline regressors capturing the mean signal for each run. In this representation, time runs from top to bottom, and lighter colors 
represent more activity.

Estimating the Model
^^^^^^^^^^^^^^^^^^^^

Now that we have created our GLM, we will need to estimate the beta weights for each condition. From the SPM GUI click Estimate, and then double-click on the field Select SPM.mat. Change the Write 
residuals option to Yes. Navigate to the 1stLevel directory and select the SPM.mat file, and then click the green Go button. This will take a few minutes to run.

The Contrast Manager
^^^^^^^^^^^^^^^^^^^^

When you have finished estimating the model, you are ready to create contrasts. If we estimate a beta weight for the Incongruent condition and a beta weight for the Congruent condition, for example, we 
can take the difference between them to calculate a contrast estimate at each voxel in the brain. Doing so for each voxel will create a contrast map.

To create these contrasts, click on the Results button of the SPM GUI, and select the SPM.mat file that was generated after estimating the model. You will see the design matrix on the right side of the 
panel. Click on Define New Contrast, and in the Name field type Inc-Con. In the contrast vector window, type 0.5 -0.5 0.5 -0.5, and then click submit. If the contrast is valid, you should see green text 
at the bottom of the window saying “name defined, contrast defined”. Make sure that you contrast manager looks like the figure below, and then click OK to create the contrast.
