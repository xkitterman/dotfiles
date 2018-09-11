#!/usr/bin/env python

import os

files = [
    "bash_aliases",
    "bash_colors",
    "bashrc",
    "gitconfig",
    "gitignore",
    "gvimrc",
    "inputrc",
    "tmux.conf",
    "vim",
    "vimrc",
    "zshrc",
]

homedir = os.path.expanduser("~")
currdir = os.path.dirname(os.path.realpath(__file__))

for f in files:
    src = os.path.join(currdir, f)
    dst = os.path.join(homedir, ".{}".format(f))

    if (os.path.exists(dst)):
        if (os.path.islink(dst)):
            # link already exists
            # check to see if its pointing to source
            if (os.path.realpath(dst) != os.path.realpath(src)):
                # link does not point to source
                os.unlink(dst)
                os.symlink(src, dst)
                print("Updated symlink {} => {}".format(dst, src))
        else:
            # a file exists where link will go
            # TODO prompt user to delete this file and replace with link
            print("Unable to symlink {} => {}".format(dst, src))
    else:
        # link does not exist
        os.symlink(src, dst)
        print("Created symlink {} => {}".format(dst, src))

print("Setup complete")
