# Emacs Configuration Files

## Setup

First, clone the repository and update all required submodules

    # This is forked from my friend, so if you would like his awesome improvements
    # git clone git://github.com/keelerm84/.emacs.d.git
    # otherwise, run this
    git clone git://github.com/caesargus/.emacs.d.git
    cd .emacs.d
    git submodule init
    git submodule update --recursive
    # additional steps
    # start emacs so that it can install things
    # package install evil-tabs
    # package install org (updated org mode to stop errors from displaying)

### Dependencies

In order to provide preview capabilities with the markdown plugin, you need to
install a markdown converter.  For Fedora, you can install it with

    sudo yum install python-markdown2
    sudo ln -s /usr/bin/markdown2 /usr/bin/markdown

The use of the global tagging system requires the emacs-global extension.

    sudo yum install emacs-global

In order to get the syntax highlighting in exported PDF documents from Org
Mode, you need to install the python pygments and LaTeX minted packages.

    sudo yum install texlive-minted
    sudo python3-pip install pygments

Scala integration requires a couple of tools.  Obviously, you must install
scala and sbt, but also the
[ensime-sbt-cmd](https://github.com/aemoncannon/ensime-sbt-cmd) plugin.  Follow
the documentation in the github README for installation details.
