# Use the official HashiCorp Terraform image as the base image
FROM hashicorp/terraform:1.12

RUN apk add --no-cache \
    bash=4.4.19-r1 \
    curl=7.64.0-r3 \
    python3=3.6.5-r1 \
    py3-pip=10.0.1-r0 \
    python3-dev=3.6.5-r1 \
    gcc=8.3.0-r0 \
    musl-dev=1.1.20-r4 \
    linux-headers=4.19.36-r0 \
    && python3 -m venv /azcli-venv \
    && . /azcli-venv/bin/activate \
    && pip install --upgrade pip \
    && pip install azure-cli \
    && export PATH="/azcli-venv/bin:$PATH" \
    && az version
