# Use the official HashiCorp Terraform image as the base image
FROM hashicorp/terraform:1.12

RUN apk add --no-cache \
    bash=5.2.15-r9 \
    curl=8.7.1-r0 \
    python3=3.12.3-r0 \
    py3-pip=24.0-r0 \
    python3-dev=3.12.3-r0 \
    gcc=13.2.1_git20240210-r6 \
    musl-dev=1.2.4-r1 \
    linux-headers=6.6.32-r0 \
    && python3 -m venv /azcli-venv \
    && . /azcli-venv/bin/activate \
    && pip install --upgrade pip \
    && pip install azure-cli \
    && export PATH="/azcli-venv/bin:$PATH" \
    && az version
