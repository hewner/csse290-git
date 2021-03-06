
Read sections 7.3 (Stashing and Cleaning) and 7.7 (Reset) of the git
book.

You might want to particularly pay attention to

    git stash pop

which the book doesn't talk about too much but is useful for the
assignments.

After this class, you will be responsible for:

    git reset <lots of options>
    git stash <lots of options>

In particular, make sure you fully understand the different between
soft mixed and hard resets.



# Step 2: 3 small scripts

So this assignment will be 3 small scripts.  They won't require a full
programming language like ruby - instead they can be implemented by
simple shell scripts.  If you've never written a shell script before,
[here's an example one](setup_files).

If you'd prefer - continue to write in ruby or the language
of your choice.


## Script 1: revertExceptFile

This script is designed to run in an existing git repo.

This file takes two parameters, the SHA of a particular commit and a
filename.  It should reset the git repo completely to a particular
commit, except for the given filename.  That file should remain as it
is right now.  That one file should be listed as an untracked change after the script is run.

    ~/git/js-parsons % echo "Buffalo is cool" > parsons.js
    ~/git/js-parsons % echo "Buffalo is cool" > README.md
    ~/git/js-parsons % git status
    On branch mycoolname
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
    
            modified:   README.md
            modified:   parsons.js
    
    no changes added to commit (use "git add" and/or "git commit -a")
    ~/git/js-parsons % git log --pretty=format:"%h %s" | head -3
    8f8b652 My comment
    7e64813 Minor css fixes to prevent misbehaving in some environments
    bebf70e Minor fixes to pseudocode, python variable handling, and executable code handling
    ~/git/js-parsons % revertExceptFile 7e64813 README.md
    HEAD is now at 7e64813 Minor css fixes to prevent misbehaving in some environments
    ~/git/js-parsons % git log --pretty=format:"%h %s" | head -3
    7e64813 Minor css fixes to prevent misbehaving in some environments
    bebf70e Minor fixes to pseudocode, python variable handling, and executable code handling
    3a17c6e Merge pull request #19 from vkaravir/turtlet-grader
    ~/git/js-parsons % git status
    On branch mycoolname
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
    
            modified:   README.md
    
    no changes added to commit (use "git add" and/or "git commit -a")

Hints

-   You can copy the file to be saved to /tmp and then copy it back


## Script 2: smashLastTwo

This script is designed to run in an existing git repo that might have
some changes (either staged or unstaged).

This script should take the last 2 commits to the repo, smash them
together into a single commit and then commit that.  The current head
should then point to the newly created commit.  It should do this and
then restore any staged or unstaged changes so that the current state
seems unmodified (except of course the history is different).

This kind of thing can be do with an interactive rebase, but you can
accomplish the same task with just some use of resets.

    ~/git/js-parsons % git status
    On branch mycoolname
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
    
            modified:   README.md
    
    no changes added to commit (use "git add" and/or "git commit -a")
    ~/git/js-parsons % git log --pretty=format:"%h %s" | head -3
    7e64813 Minor css fixes to prevent misbehaving in some environments
    bebf70e Minor fixes to pseudocode, python variable handling, and executable code handling
    3a17c6e Merge pull request #19 from vkaravir/turtlet-grader
    ~/git/js-parsons % smashLastTwo
    <BUNCH OF STUFF PRINTS OUT>
    ~/git/js-parsons % git log --pretty=format:"%h %s" | head -3
    32c6526 SMASH
    3a17c6e Merge pull request #19 from vkaravir/turtlet-grader
    b1b6576 Merge pull request #18 from vkaravir/python-exec-merge
    ~/git/js-parsons % git status
    On branch mycoolname
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
    
            modified:   README.md
    
    no changes added to commit (use "git add" and/or "git commit -a")

Hints

-   If you want to refer to the previous prevous commit, use HEAD~~
-   Don't overthink it!  My solution is 4 lines long


## Script 3: oneStepBack

This script is designed to run in an existing git repo that might have
some changes (either staged or unstaged).

This script should take the recent changes to the repo, and move them
all 1 step back.

1.  Head should become the previous commit
2.  What was last commit before the script was run should become
    staged changes to head
3.  What changes were staged before the script was run should become
    unstaged
4.  Any unstaged changes before the script was run should be stashed

    ~/git/testRepo % git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
    
            new file:   added_example.txt
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            not_added_example.txt
    
    ~/git/testRepo % git log --pretty=format:"%h %s" | head -3
    8dda548 forth commit
    170148d third commit
    2c2aafe second commit
    ~/git/testRepo % chmod a+x ~/git/HomeworkCode/ResetAndStachSECRET/oneStepBack
    ~/git/testRepo % rehash
    ~/git/testRepo % oneStepBack
    <PRINTS SOME STUFF>
    ~/git/testRepo % git log --pretty=format:"%h %s" | head -3
    170148d third commit
    2c2aafe second commit
    67e424e first commit%                                                           ~/git/testRepo % git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
    
            new file:   forthCommit.txt
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            added_example.txt
    
    ~/git/testRepo % git stash list
    stash@{0}: WIP on master: 8dda548 forth commit

Hints

-   If you want to refer to the prevous commit, use HEAD~
-   git stash takes a -u argument that lets you work on untracked files
-   Don't overthink it!  My solution is 5 lines long


# Step 3: Turn-in

You will turn in via Moodle.  Turn in the code for your 3 scripts.

