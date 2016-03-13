#!/bin/bash -eux

sudo add-apt-repository -y ppa:git-core/ppa

echo "TMUX repository"
sudo add-apt-repository -y ppa:pi-rho/dev
sudo add-apt-repository -y ppa:djcj/screenfetch
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# Terminator repository
sudo add-apt-repository -y ppa:gnome-terminator
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt-get update -y
sudo apt-get install -y tmux

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
