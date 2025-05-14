# Use the official HashiCorp Terraform image as the base image
FROM hashicorp/terraform:1.12

RUN apk add --no-cache \
    bash=5.2.37-r0 \
    curl=8.12.1-r1 \
    python3=3.12.10-r0 \
    py3-pip=24.3.1-r0 \
    python3-dev=3.12.10-r0 \
    gcc=14.2.0-r4 \
    musl-dev=1.2.5-r9 \
    linux-headers=6.6-r1 \
    && python3 -m venv /azcli-venv \
    && . /azcli-venv/bin/activate \
    && pip install --upgrade pip \
    && pip install azure-cli \
    && export PATH="/azcli-venv/bin:$PATH" \
    && az version
