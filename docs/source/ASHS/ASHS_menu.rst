ASHS
====

What is ASHS?
^^^^^^^^^^^^^

ASHS is software for automatic segmentation of the medial temporal lobe (MTL) substructures from brain MRI scans. These structures are involved in early 
Alzheimer's disease and in a number of other neurological conditions. They are also important in research on memory and cognition. For more information, 
please check `here <https://sites.google.com/view/ashs-dox/home?authuser=0/>`__.

ASHS Installation
*****************

ASHS installation is very user friendly. All you need to do is go `here<https://www.nitrc.org/frs/?group_id=370>`__ and download the most recent version of 
fast-ashs(v2.0.0 (July 2018)) and put the file into your ASHS directory. Next, unzip the file *ashs-fastashs_2.0.0_07202018.zip* by type:

  unzip ashs-fastashs_2.0.0_07202018.zip

Now, you need to set up the environment, let's start with the ASHS_ROOT:

  export ASHS_ROOT=/home/ASHS/ashs-fastashs

To avoide use this command everytime when you log in, you can type this in the bashrc (Linux system) or .cshrc(Mac) file, please go `there 
<https://neuroimage-book02.readthedocs.io/en/latest/Linux_system/useful_command.html?highlight=profile>`__ for more details.

After set up, you can verify the the environment by::

  $ASHS_ROOT/bin/ashs_main.sh -h 

If you see the output like this::

  ashs_main: automatic segmentation of hippocampal subfields
  usage:
  ashs_main [options]
  ...

You are good to go.

Run ASHS
********

Once you set up, you can run ASHS by a very simple command. 

For running ASHS on a single core::

  bash $ASHS_ROOT/bin/ashs_main.sh \
   -I subj001 \
   -a $HOME/ASHS/atlas \ 
   -g subj001_mprage.nii.gz \
   -f subj001_tse.nii.gz \ 
   -w $HOME/ASHS/output 

The ``-I`` option provides the ID for the subject, which will be the ID in the output directory.The ``-g`` and ``-f`` options require the T1 and 
T2-weighted MRI scans, respectively. If you are only using the ASHS-PMC-T1 atlas, simply supply the T1-weighted MRI scan to both -g and -f arguments. 
``-a`` points to the location of the atlas file, ``-w`` points to the directory where the ASHS output will be.

You also can run ASHS with multiple cores with add one more argument::

  bash $ASHS_ROOT/bin/ashs_main.sh -P \
   -I subj001 \
   -a $HOME/ASHS/atlas \
   -g subj001_mprage.nii.gz \
   -f subj001_tse.nii.gz \
   -w $HOME/ASHS/output

Building the Atlas
******************

