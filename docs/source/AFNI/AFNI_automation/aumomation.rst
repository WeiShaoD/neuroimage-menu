Automation
==========

Since we have 16 subjects and each subject has 3 runs. In total, we need to repeat all the preprocessing and 1st level analysis in AFNI_GUI 48 times! it is not hard but it is a really tedious job and you 
could make errors easily. As Joey from Friends said, there’s gotta be a better way, and there is.

Here is the script that makes your life easier!

Creat a design file
*******************

Since you have analyzed the first subject, sub-02, you have created a file called **proc.sub_02**. This contained a list of AFNI commands, composed in a manner determined by the ``uber_subject.py GUI``. 
``cp`` this file to the BART directory that has all of your subjects, and rename is to proc_BART.sh:


