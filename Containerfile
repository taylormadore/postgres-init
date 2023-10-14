# Use Alpine as the base image
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    postgresql-libs \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir ansible psycopg2-binary

# Create a directory for your playbook
WORKDIR /ansible

# Copy your Ansible playbook into the container
COPY ansible/playbook.yml /ansible/

# By default, run ansible-playbook command with the provided playbook file
CMD ["ansible-playbook", "/ansible/playbook.yml"]
