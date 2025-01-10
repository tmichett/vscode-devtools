# vscode-devtools
VSCode Dev Tools Container

The `.devcontainer/devcontainer.json` can be added to any respository to allow devlopment in VSCode through the specified container. This repository is used to allow running of a **PreCommit** container which will run all `pre-commit` checks on a selected repository. There is a provided **precommit_config.env** environment file to add your SSH key configuration information. This can be used with the **Run_Precommit_Check.sh** script to run `pre-commit` checks in the current working directory. The **Run_Precommit_Check_Interactive.sh** will prompt the user for the Github repository directory, the directory that contains your Github SSH Key, and the name of your Github SSH Key.



The scripts utilize the container image built from Containerfile and it has been built and is available at **quay.io/tmichett/precommit_check**.

# Before you Begin

Copy the **Run_Precommit_Check.sh** and **Run_Precommit_Check_Interactive.sh** to your path. In my instance, I am using **/usr/local/bin**.

1. Copy the correct Script files to a binary path in your directory. In this instance, **/usr/local/bin**.
```
sudo cp Run_Precommit_Check.sh /usr/local/bin/
sudo cp Run_Precommit_Check_Interactive.sh /usr/bin/local/
```

> [!TIP]
> There is a MacOS version for the Apple Silicon (M-Series chips) which is **Run_Precommit_Check.zsh**

## Running the Automated Pre-Commit Checks

1. Update the **precommit_config.env** file with the correct information and copy it to your home directory.
```
SSH_KEY_PATH="$HOME/.ssh"
SSH_PVT_KEY="github_id"
```

2. Enter the Github repo project directory.
```
cd /home/travis/Github/ole-config-labenv
```

3. Run the **Run_Precommit_Check.sh** script.
```
[travis@fedora ole-config-labenv]$ Run_Precommit_Check.sh

... OUTPUT OMITTED ...

check for merge conflicts................................................Passed
Executable text files have shebangs......................................Passed
No-tabs checker..........................................................Passed
yamllint.................................................................Passed

... OUTPUT OMITTED ...
```

## Running the Interactive Pre-Commit Checks

1. Run the **Run_Precommit_Check_Interactive.sh** script.
```
[travis@fedora ole-config-labenv]$ Run_Precommit_Check_Interactive.sh
Enter the path for the Github repository
/home/travis/Github/ole-config-labenv
Enter the path for your SSH private key
/home/travis/.ssh
Enter the name of your private key
github_id

... OUTPUT OMITTED ...

check for merge conflicts................................................Passed
Executable text files have shebangs......................................Passed
No-tabs checker..........................................................Passed
yamllint.................................................................Passed

... OUTPUT OMITTED ...
```

