Linux system
============

.. image:: linux-logo.png

Linux system set up
^^^^^^^^^^^^^^^^^^^
Every chef needs a good cooking table, Linux system would be ours
 
Linux is a open-source operating systems created by Linus Torval, it is free and function for programming user interface as well as Graphical user interface (Windos) both.Unlike commerical system like Windows,There are many free software and libraries developed for Linux, especially the neuroimage packages.

Compared with the Windows syste, the files system of Linux is quite different

.. image:: File-Systems-Linux-vs-Windows-Edureka-768x500.png

If you use Macintosh developed by Apple such as macOC, no change needed. However, if you like me, can't let windows go, you might need some extra works in order to set up for brain image analysis. This documention I will focus on the Linux system (under the Windows) only.  

A Linux distribution is an operating system made from a software collection that is based upon the Linux kernel, as well as package management system. Linux users usually obtain their operating system by downloading one of the Linux distributions, which are available for a wide variety of systems ranging from embedded devices and personal computers to powerful supercomputers.There are many popular Linux distributions include Ubuntu or Centos
 
As a windows user, Before you install the Linux distribution, make sure that you enable the Windows subsystem(WSL) for `linux feature <https://www.how2shout.com/how-to/enable-windows-subsystem-linux-feature.html>`__ 

After that, you can download `Ubuntu <https://ubuntu.com/download>`__ and install it on Windows 10 with WSL. Or you can get CentOS from `here <https://github.com/wsldl-pg/CentWSL/releases/tag/8.1.1911.1>`_ and install it with WSL

Once you have done, go to the search bar and type the name. 

   
 

Shell and Most useful commands
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The Shell is an interactive interface that allows users to execute other commands and utilities in Linux and other UNIX-based operating systems. When you login to the operating system, the standard shell is displayed.

There are many shells such as bash, Tcsh, Ksh,Zshm. Bash would be the defult shell for many linux systems. You can check the current shell by typing::

  echo $SHELL 

.. image:: Shell_1.PNG

if you see this, you are good to go, or you can change the shell to bash by typing::

  chsh -s /bin/bash

.. image:: Shell_2.PNG


Just like some spices are good all the time, some basic commands are necessary and useful when you use linux::

  ls 

  cd 

  rm

  mv 

  makdir 

Now, open a terminal either by Centos or Ubuntu, you can see this 

.. image:: Centos_open.PNG

put ls, you will see all the files and sub-directories in the current directory

.. image:: ls.PNG

you also can find the files in sub-directories directly::

  ls happy_birthday 

.. image:: ls_subD.PNG

cd (“change directory”) is used to change the current working directory in Linux::
 
  cd happy_birthday  go to happy_birthday directory from current working directory
  cd ..              go back to parent directory 
  cd                 go to the home directory 
   
