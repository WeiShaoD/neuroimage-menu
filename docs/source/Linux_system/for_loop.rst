For loop and sed 
================

For loop
^^^^^^^^

For loop probably is the one of the most useful commands to automated the processes with neuroimage data

First, you can use a for loop in your terminal by typing::

  for i in 1 2 3; do echo $i; done

The for-loop has three sections, separated by semicolons.

1 The first section is the Declaration: it begins by assigning the first item after “in” to the variable “i”; in this case, it would assign the value “1” to “i” .The numbers after “in” are called the “List”

2 The next section is the Body, which runs the commands written after “do,” replacing the  replacing the variable with whichever value is currently assigned to the variable, for the first loop, this will be the$

3 The last section, called the End, contains only the word “done”, meaning to exit the loop after all of the items in the list have been run through the Body of the loop

You can add more commands to the Body section, if they are separated with a semicolon. For example, we could change the loop to::

  for i in 1 2 3; do echo $i; echo “You just printed the number $i”; done

The for loops would be really useful when we run multiple subjects for the analysis, for example, you can use::

  for subj in sub-01 sub-02 .... sub-99; do echo $subj; done                                                                                                                                                       

To add the subjects and prolong the "list". More importantly,task would be quite simple if you can combine with other you can use for loop to help. for examplp::

  ls . | grep ^sub- > subjList.txt

``ls`` means we want to know something ``.`` indicates that what looking at the current directory, ``|`` means that whatever we did, keep continue, grep help us to collect a string of characters, ^sub means that we want to collect the file start with sub-, > to create a file, subjList.txt is the new txt file name. 

In order to analyze multiple subjects, take recon-all as an example:: 

  ls | grep  ^sub- > subjlist.txt
  
  for sub in `cat subjList.txt`; do

  recon-all -all -i ${sub}_T1w.nii.gz -s ${sub} 

This will create a txt file which contains all the subject information and run the recon-all command for each subject one by one.

sed command
^^^^^^^^^^^ 

The commands you have learned so far will allow you to create flexible scripts that can be adapted to many different scenarios. There is one more command you will learn to round out your toolkit of Unix 
commands: The ``sed`` command.

Sed is an abbreviation for “stream editor”, in that the input to sed is a stream of text - the same concept as the input and output streams that were discussed in a previous chapter. Our goal is to take 
a stream of input text and replace one string with another. Sed’s advantage over doing a similar procedure with for-loops is that sed can edit a file and only change certain words while overwriting the 
file and leaving the rest of the text intact.


