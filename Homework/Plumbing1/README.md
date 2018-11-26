---
layout: github
---


# Step 1: Reading

Read section 10.1 and 10.2 of the Git Pro book, following along with
the example.  I recommend you use a unix environment for this course -
but something like cygwin that simlates unix on windows should
probably work fine as well.

You are responsible for memorizing the meaning/use of the folowing commands:

    git hash-object -w --stdin
    git cat-file -p


# Step 2: Example Data

Clone the github repo js-parsons.

    git clone https://github.com/js-parsons/js-parsons.git

This is just a random github repo we'll be using as an example.


# Step 3: Write the code

Write a script called grep-tree-contents.  This script will take two
parameters, a tree SHA in the local repo and a string to search for.
It will then search all the blobs in the tree for that particular
string and print out lines that match.  If it encounters another
sub-tree, it will recursively grep the subtree as well.

    ~/git-assign/js-parsons % ../grep-tree-contents.rb -t 4a218e805a -s example
            <title>Simple js-parsons example assignment</title>
            <h2>Simple js-parsons example assignment</h2>
                it. This exercise is merely trying to give an example of a Parson's
            <title>Simple js-parsons example assignment</title>
            <h2>Simple js-parsons example assignment without indentation</h2>
            <title>Simple js-parsons example assignment</title>
            <h2>Simple js-parsons pseudocode example assignment</h2>
            <title>Simple js-parsons example assignment</title>
            <h2>Simple js-parsons pseudocode example assignment</h2>
          (an example is provided in the Appendix below).
      // specify the blocks for the pseudo language as a simple example case
        // names of blocks as the property values. For example, a pseudocode IF..THE
    N..ELSE..ENDIF                                                                 
        // codeline in the student's code for the LIS computation and, for example,
       // For example, the first line may not be indented.

I've provided (an example script in ruby that gives you a
start)[grep-tree-contents.rb].

But, if you prefer feel free to use any scripting language you are
comfortable with.

I recommend that you invoke and parse git command line commands from
within your script.  For example, I invoke cat-file like this 

    string_result =  `git cat-file -p #{new_sha} | grep "#{search}"`

If you were really writing git command line tools, this would sort of
be a dumb way to go about it.  Most scripting languages have libraries
that will handle interaction with git, and this is more reliable and
readable than actually invoking commands and parsing their output.

BUT, the goal here is to teach you git command line commands -- NOT
the specifics of some language's GIT library.  So I think you'll learn
better by invoking commands from within your script.  But you can
approach it in whichever way you prefer.

# Step 4: Turn-in

You will turn in via Moodle.  You must turn in 2 things:

1.  The source code of your script
2.  The a text file with the results of running the following search on js-parsons:

    ../grep-tree-contents.rb -t 7d3b207 -s NOTE

