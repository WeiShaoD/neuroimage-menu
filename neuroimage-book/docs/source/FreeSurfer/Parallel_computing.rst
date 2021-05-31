Parallel computing for recon-all
================================

The second solution to speed up recon-all is parallel computing!

Thanks to the development of technology, we have more much powerful computers than before. For example, a physical core is an actual physical processor core in your CPU. each physical core has its own 
circuitry to read and execute instructions separately. A normal laptop usually has 4-8 physical cores.

Freesufer supports the OpenMP code,which means that ``recon-all`` can be processed by multiple-cores/threads,you can recon-all one subject with multiple cores to speed with the process time. since the 
default setting for ``recon-all`` is one core, we have to tell our computer what we want.The command to tell freesurfer to run recon-all with multiple cores is ``-openmp X``, X indicates how many cores 
you want to run.

First, you need to check the CPU information, type the "lscpu" in linux system environment or press Ctrl + Shift + Esc to open Task Manager and select the Performance tab to see how many cores and 
logical processors under the Windows OS.

..  image:: CPU_info.PNG

As you can see, I have 8 cores on my laptop. Then i can add no more than the actual CPUs I have by this magic line::

  recon-all -all -i input_T1  -s subjname -openmp 8

This pipeline works for your personal computer and Supercomputer both


