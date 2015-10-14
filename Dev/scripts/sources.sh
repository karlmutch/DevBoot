#!/bin/bash -eux

sudo add-apt-repository -y ppa:git-core/ppa

echo "TMUX repository"
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -y
sudo apt-get install -y tmux

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
