Linux system
============

.. image:: linux-logo.png

Linux set up
^^^^^^^^^^^^
Every chef needs a good cooking table, Linux system would be ours
 
Linux is a open-source operating systems created by Linus Torval, it is free and function for programming user interface as well as Graphical user interface (Windos) both.Unlike commerical system like Windows,There are many free software and libraries developed for Linux, especially the neuroimage packages.

Compared with the Windows syste, the files system of Linux is quite different

.. image:: File-Systems-Linux-vs-Windows-Edureka-768x500.png

If you use Macintosh developed by Apple such as macOS, no change needed. However, if you like me, a Windows user, you might need some extra works in order to set up for brain image analysis. This documention I will focus on the Linux system (under the Windows) only.  

A Linux distribution is an operating system made from a software collection that is based upon the Linux kernel, as well as package management system. Linux users usually obtain their operating system by downloading one of the Linux distributions, which are available for a wide variety of systems ranging from embedded devices and personal computers to powerful supercomputers.There are many popular Linux distributions include Ubuntu or Centos
 
As a windows user, Before you install the Linux distribution, make sure that you enable the Windows subsystem for `linux feature <https://www.how2shout.com/how-to/enable-windows-subsystem-linux-feature.html>`__ 

After that, you can download `Ubuntu <https://ubuntu.com/download>`__ and install it on Windows 10 with WSL. Or you can get CentOS from `here <https://github.com/wsldl-pg/CentWSL/releases/tag/8.1.1911.1>`_ and install it with WSL

Once you have done, go to the search bar and type the name. 

WSL and Xming   
^^^^^^^^^^^^^

For these MacOS, you can ship this chapter. For Windows user,The Windows Subsystem for Linux (WSL) ensure you can run a Linux distribution with "virtualized" environment under Windows OS. Some common linux distributions like CentOS and Ubuntu, are currently available from the Windows App store for download and use in WSL.

To setup WSL, the PowerShell must first be used to enable WSL. Then a linux distribution needs to be installed in the WSL environment. Subsequently additional software may need to be installed to run on the Windows side and/or in the Linux distribution running under WSL depending upon what you want to run under Linux.

In order to run X-windows based graphics programs in WSL, an X server needs to be installed on the Windows side (since the Windows OS is driving the graphics hardware and there is no native X server in Windows). Accordingly, the WSL linux environment needs to be set/tested to run X based graphics in WSL with the X server running under Windows (instead of under Linux).

set up Windows PowerShell, open it. run the "enable optional feature" command::

 Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Download and set up `Xming <http://www.straightrunning.com/XmingNotes/>`__ 

Shell 
^^^^^

The Shell is an interactive interface that allows users to execute other commands and utilities in Linux and other UNIX-based operating systems. When you login to the operating system, the standard shell is displayed.

There are many shells such as bash, Tcsh, Ksh,Zshm. Bash would be the defult shell for many linux systems. You can check the current shell by typing::

  echo $SHELL 

.. image:: Shell_1.PNG

if you see this, you are good to go, or you can change the shell to bash by typing::

  chsh -s /bin/bash

.. image:: Shell_2.PNG



Basic commands 
^^^^^^^^^^^^^^

Just like some spices are good all the time, some basic commands are necessary and useful when you use linux::

  ls  #ls command lists files and directories within the file system, and shows detailed information about them

  cd  #cd (“change directory”) is used to change the current working directory in Linux 

  rm  #rm is a basic command to remove objects such as files, directories and symbolic links
 
  mv  #mv is a command that moves one or more files or directories from one place to another

  mkdir #mkdir (make directory) command allows you to create or make new directories

  cp  #cp is for copying files and directories

Now, open a terminal either by Centos or Ubuntu, you can see this 

.. image:: Centos_open.PNG

use ``ls``, you will see all the files and sub-directories in the current directory

.. image:: ls.PNG

you also can find the files in sub-directories directly::

  ls happy_birthday 

.. image:: ls_subD.PNG

cd to happy_birthday

.. image:: cd_birthday.PNG 
 
  cd happy_birthday  #go to happy_birthday directory from current working directory
  cd ..              #go back to parent directory 
  cd                 #go to the home directory 
   
make cakes and party directory 

.. image:: make_cakes_party.PNG

next, mv cakes to the party

.. image:: mv_cakes.PNG

of course, cakes are always not enough for the party, so copy the pudding.

.. image:: cp_pudding.PNG

Now, let's how many desserts we have 

.. image:: dessrts.PNG 

wait a miniuits, where is the biscuit come from, I don't want that in the party. just remove it

.. image:: rm_biscuit.PNG

Now, we have all the desserts for a birthday party

these are the 6 basic commands you will use in the future whether you use you own laptop or server for the analysis
 
you also can use:: 

man ls/cd/mv/rm/cp/mkdir for more details 



you can use ``find . -name "file_name"``to find the file_name information in the subdirectory
