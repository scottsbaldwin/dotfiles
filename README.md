dotfiles
========

Wellmatch Dotfiles

Dotmatrix is a collection of dotfiles used at Hashrocket to customize various
deveopment tools. This project is the culmination of many years worth of
tinkering with our favorite tools to get them to behave just right. We think
using dotmatrix makes working with these tools more pleasant and hope you will
too!

Looking for **wmenv** documentation? See [WMENV.md](WMENV.md).

What are dotfiles?
------------------

Dotfile are really just plain text files that start with a '.' and they are
used to set preferences for things like Git and Vim. To see your current
dotfiles, open a terminal and in your home folder run this:

	$ ls -a


Install
-------

Start by cloning down the repo:

	$ git clone https://github.com/healthagentech/dotfiles.git

Then run this script:

	$ bin/install

This script symlinks all dotfiles into your home directory.

**Please note:** This will only install files that do not already exist in your
$HOME directory. If you have, e.g. your own .bashrc file, you can move it to
~/.bashrc.local, and dotmatrix will source it for you.

Partial Installation
--------------------

Sometimes it's useful to only install part of dotmatrix. For partial
installation, you can create a `FILES` file in the root of dotfiles that
contains a newline-delimited list of dotfiles to symlink and keep up to date
with dotfiles.

When `FILES` exists in the dotfiles source directory, running `bin/install`
will only symlink the dotfiles listed within `FILES`.

If, for example, you only want the tmux configuaration and wmrc files, and
want to ignore all of the rest of dotfiles's dotfiles:

    $ cd path/to/dotfiles
    $ cat FILES
    .tmux.conf
    .wmrc
    $ bin/install # Only installs .tmux.conf and .wmrc

Vim bundles
-----------

For Vim users, there's another script you might want to run, after you've run
bin/install:

	$ bin/vimbundles.sh

This will install the set of Vim bundles we use.

After you've done ./bin/install, you'll have a .vimbundle file and this is a
manifest of sorts that the vimbundles.sh script will use to install various vim
plugins. If you have other plugins that you like that aren't on this list, you
can put them in a ~/.vimbundle.local and that will be installed secondarily.

The ~/.vimbundle.local file should include one plugin per line, each having the
following format:

	github-user/repo-name

You need not include a trailing `.git`.

In addition, our Dotfiles support the ability to limit plugins for a given project.  Simply place a `.vimbundle` file in the project root, containing a whitelist of the plugins that should be loaded. This gives us the flexibility to have specific global, personal and project-specific plugin configurations that match the behavior of the `.vimrc` file. This gives us the ability to experiment with new plugins easily, as well as to triage potential issues by limiting what is loaded.

Project `.vimbundle`s are also consulted when installing/updating plugins -- as long as they are within the `$WELLMATCH_DIR`. This directory can, of course, be overridden on your local machine should you choose to organize things differently.

## Terminal configuration
---

The `vim` setup contains both the `vim-airline` plugin and its configuration.  This gives you a nice status line in `vim` that looks like this: ![vim-airline](https://goo.gl/rFJcb3)

In order for this to work, your terminal emulator needs to use a font with the requisite symbols. A list of them can be found in the [powerline-fonts](https://github.com/powerline/fonts) repository.  Some recommended choices are [Hack][hack-font], [Meslo](https://github.com/powerline/fonts/raw/master/Meslo/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.otf) or [Fira](https://github.com/powerline/fonts/raw/master/FiraMono/FuraMono-Regular%20Powerline.otf).  To use, download the font to your local machine, install it (on OSX, this means using Font Book), and configure your terminal emulator to use them.  Note that you may need to tweak the font settings (particularly the size) to get the chevrons to line up _juuuuuuust_ so.  

In case you're using iTerm2:  to configure, go to `Preferences` -> `Profiles` -> `Text`, and set both the `Regular Font` and `Non-ASCII Font` settings to the one you just installed.  You may have to tweak the font size, particularly for the `Non-ASCII Font` setting, to get the chevrons to line up.  Using the [Hack][hack-font] font, you will likely need to set `Non-ASCII Font` size to be 1pt smaller than the `Regular Font` size.

  [hack-font]: https://github.com/powerline/fonts/raw/master/Hack/Hack-Regular.ttf "Hack Regular"

Actively Maintained
-------------------

At WellMatch we use dotmatrix on all of our development machines, then for
many of us we get so used to the setup that we use it on our personal machines
too. That means there's a lot of picky nerds using dotmatrix every day to make
their tools easy and fun to use.

Update
------

Keeping your dotfiles up-to-date is easy. Just visit the dotfiles directory
and run `bin/upgrade`. This will fetch the latest changes from GitHub and
symlink any new files.
