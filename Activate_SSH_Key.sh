#!/bin/bash



#!/bin/bash

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
echo $(ssh-add -L)
echo "Run 'source ~/.ssh-agent-variables' to use the SSH agent globally."


# Ask for SSH Key Location
#echo "Enter your SSH Key Location:"
#read KEYfile

#eval $(ssh-agent)
#ssh-add $KEYfile
