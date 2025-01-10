#!/bin/zsh

source $HOME/precommit_config.env

GITHUB_PATH=$(pwd)
echo $SSH_KEY_PATH
echo $SSH_PVT_KEY
echo $GITHUB_PATH

podman run --name toolbox --rm -it -v $GITHUB_PATH:/Github:Z -v $SSH_KEY_PATH:$SSH_KEY_PATH:Z -e "SSH_PVT_KEY=$SSH_PVT_KEY" -e "SSH_KEY_PATH=$SSH_KEY_PATH" quay.io/tmichett/precommit_check_arm /bin/bash

#podman run --name toolbox --rm -it -v $GITHUB_PATH:/Github:Z -v $SSH_KEY_PATH:$SSH_KEY_PATH:Z -e "SSH_PVT_KEY=$SSH_PVT_KEY" -e "SSH_KEY_PATH=$SSH_KEY_PATH" quay.io/tmichett/precommit_check_arm /opt/tools/Activate_Precommit_Auto.sh
