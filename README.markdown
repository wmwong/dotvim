# Installation

Clone the git repository and it's submodules.

    git clone https://wmwong@github.com/wmwong/dotvim.git ~/.vim
    cd ~/.vim
    git submodule init
    git submodule update

Softlink your .vimrc.

    ln -s ~/.vim/vimrc ~/.vimrc

Certain colorschemes require 256 colors (like Molokai).

    sudo apt-get install ncurses-term -y
    echo 'export TERM=xterm-256color' >> ~/.bashrc

jslint requires spidermonkey, rhino, or node.js.

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update 
    sudo apt-get install nodejs -y

Ack requires ack!

    sudo apt-get install ack-grep -y
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

# Reference

## Add a git submodule

    git submodule add <git url> bundle/<plugin name>

## Remove a git submodule

Git submodules must be removed manually.

1. Remove from .gitmodules file
2. Remove from .git/config file
3. Remove from cache

        git rm --cached <plugin path>

## Pull git submodules

    git submodule foreach git pull origin master

## Links

* [Vimbits](http://vimbits.com)

# Historical

Command-t requires vim to be compiled with ruby. It also needs to be made using the system's default ruby.

    sudo apt-get install vim-gnome -y # installs gvim which recompiles vim with ruby
    rvm use system # only if you use RVM (recommended)
    cd ~/.vim/bundle/command-t
    rake make
