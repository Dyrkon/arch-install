#!/bin/bash

export POSIXLY_CORRECT=yes
export LC_NUMERIC=en_US.UTF-8

install_pacman_packages() {
  cat pacman.lst | xargs pacman -S --needed --noconfirm
}

set_vimrc() {
  cp .vimrc ~/
}

get_vimrc() {
  cp ~/.vimrc .
}

setup() {
	set_vimrc

	install_pacman_packages

	pacman -Syu
}

backup() {
  pacman -Syu

  # Backup pacman and yay
  pacman -Qqe | grep -v "$(pacman -Qqm)" > pacman.lst
  
  get_vimrc

  # Backup pip3
  pip3 freeze > requiremets_pip.txt
}

run() {
  echo 'For backup press "B" enter...'
  echo 'For setup press "S" enter...'
  read -r -p "Enter S or B:" CHOICE

  while true
  do
    if [ "$CHOICE" = "S" ];
    then
      setup
      exit
    elif [ "$CHOICE" = "B" ];
    then
      backup
      exit
    else
      echo "Wrong choice"
      read -r -p "Enter S or B:" CHOICE
    fi
  done
}

run
