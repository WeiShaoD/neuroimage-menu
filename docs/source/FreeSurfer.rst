Freesufer
=========

Welcome to the Freesufer unit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What is FreeSufer?

FreeSurfer is a brain imaging software package. It focuses on analyzing magnetic resonance imaging (MRI) scans of brain tissue, functional brain mapping and contains tools to conduct both volume-based and surface-based analysis.


FreeSurfer includes tools for the reconstruction of topologically correct and geometrically accurate models of both the gray/white and pial surfaces, for measuring cortical thickness, surface area and folding, and for computing inter-subject registration based on the pattern of cortical folds.

recon-all
^^^^^^^^^
The most powerful function of FreesSufer is the recon-all command, it will performs all the cortical reconstruction process 

Noramllly, recon-all command will cost 8-10 hours for one subjects, however, if you have powerful laptop or Suptercomputer/Server, there is a way that can reduce the time dramatically.

A physical core is an actual physical processor core in your CPU. Each physical core has its own circuitry and its own L1 (and usually L2) cache can read and execute instructions separately (for the most part) from the other physical cores on the chip.A logical core is more of a programming abstraction than an actual physical entity. Logical cores are the abilities of a single physical core to run multiple tasks or threads simultaneously.Nobody really knows what the these description mean, but we can take advantage of it to reduce the processing time of recon-all

Due to Freesufer emalble the OpenMP code,recon-all can be processed by multiple-cores,ths means that you can either recon-all one subjects with multiple cores or run recon-all multiple subjecets with many cores(cpus) at once    

the command to tell recon-all run multiple cores is -openmp X, X means how many cores you want to run

parallel computing for recon-all
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
