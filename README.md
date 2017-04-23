# Pamplona

> You can't get away from yourself by moving from one place to another.
> ― Ernest Hemingway, The Sun Also Rises

**NOTE:** This is still in active development.

Pamplona is my personal workspace built to always be accessible on any fresh
Ubuntu install I need. It assumes Debian-based systems and is very much a
personalized experience for myself.

SaltStack is the underlying build tool and a Vagrant box is added to test the
formulas.

## Getting Started

Clone this repo or download the files locally. There are two scripts that can
manage all of the salt work needed:

- bin/boostrap: For installing a salt minion and configuring it
- bin/update: For updating the pillars and states and running highstate

You can run `./bin/update` and it will run the bootstrap script as well.

## Using Vagrant

There isn't a lot of use for these states and Vagrant as a server. If you're
building a virtualbox to work in though it should be helpful. Running `vagrant
up` will get everything set up for you. Subsequent vagrant ups will call the
highstate and update the states on the system.

## Requirements still to do

- [ ] vundle
- [ ] mysql
- [ ] dotfiles
- [ ] (maybe) private-internet-access (https://www.privateinternetaccess.com/installer/install_ubuntu.sh)

## Todo

- [ ] Clean up naming of states
- [ ] Find out if salt-call can show progress on a masterless minion
- [ ] Add environments to top files and server dependencies so I can make pamplona desktops and servers
