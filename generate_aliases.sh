#!/bin/bash

# load all the functions from bash-my-aws
for f in ~/.bash-my-aws/lib/*-functions; do source $f; done

# generate the aliases file
echo "# GENERATED ALIASES FOR BASH-MY-AWS" > ~/.bash-my-aws/aliases
echo -e "# to regenerate run: ./generate_aliases.sh \n" >> ~/.bash-my-aws/aliases
# generate the functions except for functions starting with _
for fnc in $(compgen -A function | grep -v "_"); do
  echo "alias $fnc='~/.bash-my-aws/bin/bma $fnc'" >> ~/.bash-my-aws/aliases
done;
