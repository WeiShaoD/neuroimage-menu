ASHS
====

What is ASHS?
^^^^^^^^^^^^^

ASHS is software for automatic segmentation of the medial temporal lobe (MTL) substructures from brain MRI scans. These structures are involved in early 
Alzheimer's disease and in a number of other neurological conditions. They are also important in research on memory and cognition. For more information, 
please check `here <https://sites.google.com/view/ashs-dox/home?authuser=0/>`__.

ASHS installation is very user friendly. All you need to do is go `here<https://www.nitrc.org/frs/?group_id=370>`__ and download the most recent version of 
fast-ashs(v2.0.0 (July 2018)) and put the file into your ASHS directory. Next, unzip the file *ashs-fastashs_2.0.0_07202018.zip* by type:

  unzip ashs-fastashs_2.0.0_07202018.zip

Now, you need to set up the environment, let's start with the ASHS_ROOT:

  export ASHS_ROOT=/home/ASHS/ashs-fastashs

To avoide use this command everytime when you log in, you can type this in the bashrc (Linux system) or .cshrc(Mac) file, please go `there 
<https://neuroimage-book02.readthedocs.io/en/latest/Linux_system/useful_command.html?highlight=profile>`__ for more details.

After set up, you can verify the the environment by:

  $ASHS_ROOT/bin/ashs_main.sh -h 

If you see the output like this:

  ashs_main: automatic segmentation of hippocampal subfields
  usage:
  ashs_main [options]
  ...

You are good to go.





