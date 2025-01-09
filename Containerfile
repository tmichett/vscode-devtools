FROM fedora:latest
MAINTAINER Travis Michette <tmichett@redhat.com>

RUN dnf install -y git gh ansible-core podman python3-pip vim tree python3.9 gcc make g++ libffi-devel python3-devel pkgconfig uv && \
    dnf clean all

COPY requirements_noversion.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt 