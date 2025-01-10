#!/bin/bash

echo "Enter the path for the Github repository"
read GITHUB_PATH
echo "Enter the path for your SSH private key"
read SSH_KEY_PATH
echo "Enter the name of your private key"
read SSH_PVT_KEY

#podman run --name toolbox --rm -it -v $GITHUB_PATH:/Github:Z -v $SSH_KEY_PATH:$SSH_KEY_PATH:Z -e "SSH_PVT_KEY=$SSH_PVT_KEY" -e "SSH_KEY_PATH=$SSH_KEY_PATH" container_tools2 /bin/bash

podman run --name toolbox --rm -it -v $GITHUB_PATH:/Github:Z -v $SSH_KEY_PATH:$SSH_KEY_PATH:Z -e "SSH_PVT_KEY=$SSH_PVT_KEY" -e "SSH_KEY_PATH=$SSH_KEY_PATH" quay.io/tmichett/precommit_check /opt/tools/Activate_Precommit_Auto.sh
