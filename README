BashGo
======

This simple utility lets you store and jump to directories of note.

Installation
------------

To install, simply clone this repository into a convenient location and edit a ~/.bash_rc or ~/.profile file to include an alias that points to where you cloned it. Don't forget the "." at the beginning, this will allow the jumping behavior.

    alias go='. /path/to/bashgo.sh'

After making the edit, launch a new shell or run `source` the file you edited.

Usage
-----

To save a directory bookmark, navigate to that directory and type

    go save mycooldir

Where mycooldir is any name you'd like to associate with the path.

You can now use:

    go mycooldir

to jump to the directory you saved above.

Saved directories are automatically saved under `~/.gopaths`

**Note:** If you run save and provide a name that has already been saved, the mots recent save will take precedence. However, all of the saved paths will be visible in the .gopaths file and you can easily edit it to restore an older location.

Customizable Variable Replacement
---------------------------------

BashGo automatically remaps specified variables that are found in saved directory path. This is useful if you have a build system that has directories that correspond to current environment variables.

For example if I had a folder structure as follows:

    * ~/projects
        * myproject
            * ...
        * something
            * ...

I could set an environment variable `CURRENT_PROJECT=myproject` and edit the $VAR_REPLACE list at the top of bashgo.sh accordingly to make it so that running `go save project` inside of the myproject directory would save the directory as project=~/projects/${CURRENT_PROJECT} instead.

Now, if I change the environment variable to `CURRENT_PROJECT=something`, `go project` will take me to the ~/projects/something directory instead of the directory where I originally saved my location.


