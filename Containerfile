FROM registry.redhat.io/ubi9/toolbox:9.2 
MAINTAINER Travis Michette <tmichett@redhat.com>

RUN dnf install -y git python3.9 pip && \
    dnf clean all

COPY pre-commit_venv.tgz /opt/tools/pre-commit_venv.tgz
COPY Activate_Precommit_VENV.sh /opt/tools/Activate_Precommit_VENV.sh 
COPY Activate_SSH_Key.sh /opt/tools/Activate_SSH_Key.sh
RUN cd /opt/tools && \
    tar -xvf pre-commit_venv.tgz && \
    source /opt/tools/pre-commit_venv/bin/activate && \
    pip install pre-commit && \
    deactivate && \
    rm -rf /opt/tools/pre-commit_venv.tgz

