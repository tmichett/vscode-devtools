FROM registry.redhat.io/ubi9/toolbox:9.2 
MAINTAINER Travis Michette <tmichett@redhat.com>

RUN dnf install -y git python3.9 pip vim && \
    dnf clean all

COPY pre-commit_venv.tgz /opt/tools/pre-commit_venv.tgz
COPY Activate_Precommit_VENV.sh /opt/tools/Activate_Precommit_VENV.sh 
COPY Activate_SSH_Key.sh /opt/tools/Activate_SSH_Key.sh
COPY Activate_Precommit_Auto.sh /opt/tools/Activate_Precommit_Auto.sh
COPY root_ssh_config /root/.ssh/config
RUN cd /opt/tools && \
    tar -xvf pre-commit_venv.tgz && \
    source /opt/tools/pre-commit_venv/bin/activate && \
    pip install pre-commit && \
    deactivate && \
    rm -rf /opt/tools/pre-commit_venv.tgz
RUN mkdir /Github && \
    cd /Github && \
    git config --global --add safe.directory /Github

