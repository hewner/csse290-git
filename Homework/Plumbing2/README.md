---
layout: github
---

# Step 1: Reading

Read section 10.3 of the git book.

You are responsible for memorizing the meaning/use of the following commands:

    git commit-tree
    git update-ref

# Step 3: Write the code

Write a script called alternate-history.  This script will take a
series of trees and an output branch name.  It will create a alternate
fake history starting with the first tree, going to the second, etc.
The fake history will be placed in a branch with the given name.  Use
commit-tree and update-ref to do this - don't do sketchy things like
checkout multiple file versions.

Here's an example of me using my solution

    ~/git/js-parsons % alternate-history.rb -t cafd0d12 -t e6ab292b -o alternative-history-branch
    ~/git/js-parsons % git checkout alternative-history-branch
    Switched to branch 'alternative-history-branch'
    ~/git/js-parsons % git log
    commit 5906ac134394e23e7279690c188e521d12097f16
    Author: Buffalo <hewner@rose-hulman.edu>
    Date:   Sun Mar 13 23:20:05 2016 -0400
    
        alternative followup
    
    commit 750a0189cb8479e4571af7f0b4a44e9ff8500a69
    Author: Buffalo <hewner@rose-hulman.edu>
    Date:   Sun Mar 13 23:20:05 2016 -0400
    
        alternative begin
    
    ~/git/js-parsons % git cat-file -p 5906ac13
    tree e6ab292b8cb583d454f0e215311d15dfceb7bf33
    parent 750a0189cb8479e4571af7f0b4a44e9ff8500a69
    author Buffalo <hewner@rose-hulman.edu> 1457925605 -0400
    committer Buffalo <hewner@rose-hulman.edu> 1457925605 -0400
    
    alternative followup
    ~/git/js-parsons % git cat-file p 750a0189c
    fatal: invalid object type "p"
    ~/git/js-parsons % git cat-file -p 750a0189c
    tree cafd0d121d20251e1a60df8e4f4d99edb3d1840e
    author Buffalo <hewner@rose-hulman.edu> 1457925605 -0400
    committer Buffalo <hewner@rose-hulman.edu> 1457925605 -0400
    
    alternative begin
    ~/git/js-parsons %

If you like, I've provided a start [here](alternate-history.rb).


# Step 4: Turn-in

You will turn in via Moodle.  You must turn in 2 things:

1.  The source code of your script
2.  The a text file running a command similar to the one above,
    switching to the created branch, looking at the log, and then
    using git cat-file to dump all the commits (so I can see the trees
    are correct).  Use this command on js-parsons:

    alternate-history.rb -t 4a218e805a4b -t cafd0d12 -t e6ab292b -o alternative-history-branch

