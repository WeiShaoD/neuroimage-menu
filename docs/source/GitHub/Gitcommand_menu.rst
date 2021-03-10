Git_command
^^^^^^^^^^^

After the basic ideas, let's have more fun, you can upload an existing file to a GitHub repository using the command lines::

  git add
  git commit
  git push
             
First, go to your GitHub account and create a new repository named dinner_menu

..  image:: GitHub_dinner.PNG

Now, Open a linux terminal and cd to the local directory you want to work on
  
GitHub configuration::

  git config --global user.name "Wei Shao"
  git config --global user.email "GitHub_Emailaddress@.com"                                                             

Then, use git clone to get the remote directory from your GitHub repository                                             

..  image:: git_ssh.PNG

use ``git clone git@github.com:WeiShaoD/dinner_menu.git``
   
 ..  image:: git_clone.PNG

cd to the dinner_menu, add a new menu.txt file by typing ``nano menu.txt``, use ``git add`` and ``git commit -m ""``    

..  image:: Git_add_commit.PNG

use ``git push -u origin main`` to synchronize your local and GitHub
  
..  image:: git_push.PNG

Now you can see the new menu
        
..  image:: git_new_menu.PNG

last but not the least, you can add the content for the menu by repeate the steps above

..  image:: Git_add_course.PNG

More details form  `here <https://docs.github.com/en/github/managing-files-in-a-repository/adding-a-file-to-a-repository-using-the-command-line/>`__  
