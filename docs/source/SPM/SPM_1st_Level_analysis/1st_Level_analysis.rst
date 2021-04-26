First level analysis in SPM
===========================

Specifying the Model
^^^^^^^^^^^^^^^^^^^^

.. image:: estimate.PNG

.. image:: Contrast.PNG

.. image:: contrast_2.PNG

Since we have created the timing files previously, it is time for us to use them in conjunction with our imaging data to create statistical parametric maps. These maps could indicate that the correlation 
between the ideal time-series (the onset times convolved with the HRF in our model) and the time-series collected in this experiment. When we use the SPM to construct contrasts, beta weight represents 
the amount of modulation of the HRF, which is then transformed into a t-statistic.

To get started, create a sub-directory in sub-02 called 1stlevel so we can organize the data. Then, Open SPM GUI from Matlab terminal and select ``1st-Level``, select the 1stLevel directory we just 
created. All of the output of the 1st-level analysis will be keeped in this folder. After that, we'll fill out the section on Timing parameters. Select ``Seconds`` for the design unit, and enter a value 
of ``2`` for Interscan Interval. Then go to ``Data & Design``. and build three new sessions by clicking three times on ``New: Subject/Session``. Go to the func directory and use the "Filter and Frames 
fields" we used before to to pick all 300 volumes of the warped usable data(file start with swar) for the first session's Scans. And do the same for the othjer two session.

Return to the field for the first time. In the experiment, there are two conditions, and both conditions occur in each run. To construct two new condition fields, go to conditions and then New: Condition 
twice. Double-click on Name and type cash and explode. for the first condition.

In order to find out the onset times for each occurrence of the cash condition. From the Matlab terminal, navigate to the func directory and type:

cashRun1 = importdata('cash_run1.txt');
IncRun1(:,1)

Which will give you the onset times for cash condition in run_1, copy and paste the onset times onto the Onsets sector. Then we can therefore enter the number 0.772 in the ``Durations field``, (you can 
check the duration time by less sub-02_task-balloonanalogrisktask_run-01_events.tsv) and SPM will assume that it is the same duration for every trial.

Repeat the process for the explode condition in run 01, as well as the cash and explode conditions in run 02 and run 03, remembering to set the duration time to 2. Here's the code for displaying the 
onset times for the remaining onset times::

  explodeRun1 = importdata('explode_run1.txt');
  explodeRun1(:,1)

  cashRun2 = importdata('cash_run2.txt');
  explodeRun2(:,1)
  
  explodeRun2 = importdata('explode_run2.txt');
  explodeRun2(:,1)

  cashRun3 = importdata('cash_run3.txt');
  explodeRun3(:,1)

  explodeRun3 = importdata('explode_run3.txt');
  explodeRun3(:,1)

.. image:: Specifying_model.PNG 

The names will be stored in a file called SPM.mat in the 1stLevel directory which we will look at later in more detail. Now, click the green ``Go button`` when you're done. It should only take a few moments 
to estimate the model. When it's all said and done, it should look like this:

.. image:: model_design.PNG 

The General Linear Model for For a single subject. The ideal time-series for the cash and explode conditions for the first session are shown in the first two columns, while the ideal time-series for the 
conditions of run 02 are shown in the next two columns, the next two columns indicate the ideal time-series for the conditions of run 03. The last three columns are basline regressors that capture the 
mean signal of each run. In this figure, time runs from top to bottom, and lighter colors represent more activity.

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
