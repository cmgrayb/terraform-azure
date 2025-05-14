# Use the official HashiCorp Terraform image as the base image
FROM hashicorp/terraform:latest

RUN apk add --no-cache bash curl python3 py3-pip python3-dev gcc musl-dev linux-headers \
    && python3 -m venv /azcli-venv \
    && . /azcli-venv/bin/activate \
    && pip install --upgrade pip \
    && pip install azure-cli \
    && export PATH="/azcli-venv/bin:$PATH" \
    && az version \
    && terraform init -test-directory=tests/plan \
    && terraform test -test-directory=tests/plan \
    && terraform init -test-directory=tests/apply \
    && terraform test -test-directory=tests/apply
