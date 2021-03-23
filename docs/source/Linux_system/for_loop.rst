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

Sed introduction
****************

To see how sed works, create a text file called Hello.sh that contains the following line::

  #!/bin/bash

  echo "Hello, my name is Andy. Here is the name Andy again." 


This is simply a text file that runs one line of code. If you wanted to swap the name Andy with Bill, you would type the following::

  sed "s|Andy|Bill|g" Hello.sh

Notice that the sed command is divided into three sections:

1 Declaring the sed command;
2 A pattern to match and replace with another pattern, enclosed in quotes;
3 The file to be read into sed (in this case, Hello.sh)

Let’s focus on the pattern section. I prefer to enclose this section in double quotes, so that if I include a variable in the pattern, it will be expanded before the sed command is run. The first part of 
this section is an “s”, which means to “swap” the following pair of strings. The first of the pair is what is being searched for in the text file, and the second of the pair is what it will be replaced 
with. The “g” stands for “global”, which means to replace every instance of the first word with the second word.

If you run this command, you should see the following output::

  #!/bin/bash

  echo "Hello, my name is Bill. Here is the name Bill again."

If you wanted to redirect this output into a new text file, you would use this code::

  sed "s|Andy|Bill|g" Hello.sh > Hello_Bill.sh

As always, you can call the output file whatever you like.

Editing Files In Place
**********************

If you want to edit the file and overwrite it instead of redirecting the output into a new file, you can use the -i and -e options::

  sed -i -e "s|Andy|Bill|g" Hello.sh

The -i option stands for “in-place”, and signifies that the text file should be overwritten after the words have been swapped. The -e option is used to get the -i option to work with Macintosh operating 
systems; if it isn’t included, sed throws an error.

Using sed with for-loops
************************

As with other commands, sed can be combined with for-loops and conditional statements to write more sophisticated code. For example, let’s say that we want to create several copies of a template file, 
and only change one word of it over a list of names. Let’s start by creating a file called Names.sh which contains the following::


  #!/bin/bash

  echo "Hi, my name is CHANGENAME."

Here, CHANGENAME is a placeholder; I’ve typed it in all capital letters to make it stand out, which is especially useful in larger text files. Now we can use a for-loop to create several copies of this 
file, replacing CHANGENAME with whichever name is currently in the loop::

  for name in Andy John Bill; do
    sed -i -e "s|CHANGENAME|${name}|g" Names.sh > ${name}_Names.sh
  done

Before you type this code and run it, think about what will happen. Visualize how the items in the list will replace the variable ${name}, and how this will be swapped with CHANGENAME in the Names.sh 
file.

