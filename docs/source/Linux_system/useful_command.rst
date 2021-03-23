Useful tricks
^^^^^^^^^^^^^

There are some tricks that can make your Linx life easier. 

let's take bash_profile as an example, you can edit this profile by type::
  
  nano ~/.bash_profile  

bash_profile is a script that is executed each time you start a new terminal.

.. image:: tricks_profile.PNG

For example, In here, I have set Freesurfer by two commands:

export FREESURFER_HOME=/usr/local/freesurfer/7.1.1-1
source $FREESURFER_HOME/SetUpFreeSurfer.sh


By using ``export`` I have pointed out the freesurfer home directory where I install the freesurfer. ``source`` to activate freesurfer whenever I log in terminal.
 
``alisa 9``helps me set a hot key that I press 9 to run the command ``cd /home/shao/neuroimage-book`` 

It is not hard to find files in the current directory by ``ls``, However, if I want to want to find/delete files located at subdirectory, I have use different command such as ``ls -d $PWD/sub-??/run*`` 
as well as ``rm -r $PWD/sub-??/run*`` .

The -d option means to only list directories, and $PWD expands to an absolute path pointing to the current working directory. Within the current directory, any directory starting with sub- and ending 
with two digits (represented by the ??) is added to the path. Finally, within each subdirectory, any directory beginning with the string run will be appended to the path name (e.g., run1.feat and 
run2.feat). rm is the remove command, -r means recursive, it tells the computer to remove directories and their contents recursively

Also ``find . -name "file_name".`` can help you to find the file_name related information from the subdirectory







