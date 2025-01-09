#!/bin/bash
source /opt/tools/pre-commit_venv/bin/activate

# Ask for SSH Key Location
echo "Enter your SSH Key Location:"
read KEYfile

# Start SSH agent and save variables globally
if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)" > ~/.ssh-agent-variables
    echo "SSH agent started."
else
    echo "SSH agent already running."
fi

ssh-add $KEYfile

cd /Github
pre-commit run --all-files
