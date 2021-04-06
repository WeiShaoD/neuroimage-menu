Automation
==========

Since we have 16 subjects and each subject has 3 runs. In total, we need to repeat all the preprocessing and 1st level analysis in AFNI_GUI 48 times! it is not hard but it is a really tedious job and you 
could make errors easily. As Joey from Friends said, there’s gotta be a better way, and there is.

Here is the script that makes your life easier!

Creat a design file
*******************

Since you have analyzed the first subject, sub-02, you have created a file called **proc.sub_02**. This contained a list of AFNI commands, composed in a manner determined by the ``uber_subject.py GUI``. 
``cp`` this file to the BART directory that has all of your subjects, and rename is to proc_BART.sh. SO, Let's go to the directory which has the "pro.sub_02" file and type this::

  cp proc.sub_02 ../../../../proc.BART.sh

After that, you are able to find the proc.BART.sh in your BART directory, We are going to 2 things:

1 Remove every reference to sub-02, and turn those strings into a variable that is taken from an argument given to the script. For example, we will change the script so that it will replace the variable 
in our script with the string whatever we want, and analyze that subject’s data. for example, if we run the sctip 

2 We will replace the paths to be more generalizable so that AFNI can find the corresponding input data.

To begin with, open the proc_BART.sh with a text editor like nano. Scroll down, which contains the following code:

  # the user may specify a single subject to run with
  if ( $#argv > 0 ) then
      set subj = $argv[1]
  else
      set subj = sub_02
  endif

This is a conditional statement. The first few lines state that if the user provides an argument such as input, then set the variable “subj” to whatever the argument is. If you look through the rest of 
the script, you will see numerous lines that contain the variable “$subj”, which will be replaced by the argument. However, there are many instances - usually involving paths - that still have the string 
sub-02 hard-coded into them. In order to make the script more flexibile and have it analyze the subject that we specify, we will need to replace these with the “$subj” variable. typy “Ctrl+W” and 
"Ctrl+R" to replace it as ``${subj}``.

Next, we will need to replace any absolute paths with a relative path. As you can see in the script, there are several lines of code that contain paths starting with /Users/ajahn/Desktop/Flanker. We will 
replace this with the $PWD variable, which is a shorthand for the path to the current working directory. This will ensure that the script will be adapted to the current computer’s directory structure, 
and that no errors will be thrown due to the script being unable to locate where certain files are. 

With Nano, find the string /home/wshao/BART_afni/sub-02 (or whatever the name of the path is which points to the directory containing your subjects), and Replace it with ${PWD}. Also replace on line 
/Users/ajahn/aglobal (or whatever your username is) with ~/abin.


Automating the Analysis
***********************

We will now use this updated preprocessing script in a for-loop to analyze all of the subjects in our dataset. Use this code::

  for i in `cat subjList.txt`; do
    bash proc_BART.sh $i;
    mv ${i}.results $i;
  done

This will run the script “proc_BART.sh” for each subject in the file “subjList.txt”, using each consecutive line in the subjList.txt file as an argument each time the script runs.

This will run the preprocessing and regression for each subject, storing the output in a folder called <subjID>/<subjID>.results, in which “subjID” stands for the subject name. Each analysis will take 
5-10 minutes, depending on the speed of your computer.
