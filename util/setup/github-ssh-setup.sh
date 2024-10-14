#!/bin/sh

# create new keypair for a github account
ssh-keygen -t ed25519 -C "name" # email or some account identifier

# repeat for any other accounts

# add keys to ssh agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github1
ssh-add ~/.ssh/id_ed25519_github2

# add keys to github account from
cat ~/.ssh/id_ed25519_github1.pub

# update repository configs
git remote set-url origin git@github.com-account1:user1/repository1.git

# symlink to config
ln -s ~/.config/ssh/config ~/.ssh/config
