#!/bin/sh
install_dir="$HOME/.docker-dev-maxlech974"

rm -rf $install_dir || true

which docker

if [ "$?" -ne 0 ]
then
    sudo apt-get remove docker docker-engine docker.io containerd runc && \
    sudo apt-get update && \
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
fi

sh_aliases="${install_dir}/sh_aliases"

which zsh
if [ "$?" -eq 0 ]
then 
    grep -q  'docker-dev' ~/.zshrc || ln -s $sh_aliases $HOME/.oh-my-zsh/custom/docker-dev-maxlechere974.zsh
fi

which bash
if [ "$?" -eq 0 ]
then 
    grep -q  'docker-dev' ~/.bashrc || echo "source $sh_aliases" >> ~/.bashrc
fi




my_current_path=$PWD 
cd $HOME

cp -r $my_current_path $install_dir
rm -rf $my_current_path

rm $install_dir/install.sh




