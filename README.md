# Ansible Chatbot (llama) Stack

An Ansible Chatbot (llama) Stack.

## Pre-Installation

- Llama-stack Version: The generated Ansible Chatbot Stack container will be based on the `llama-stack` python's package version specified in the [requirements.txt](requirements.txt)

## Installation

        python3 -m venv venv
        source venv/bin/activate
        pip install -r requirements.txt

## Build

        /bin/sh llama-stack-build.sh
        /bin/sh ansible-chatbot-build.sh
        
## Run
        export ANSIBLE_CHATBOT_VLLM_URL=<VLLM_SERVING_URL>
        export ANSIBLE_CHATBOT_VLLM_API_TOKEN=<VLLM_SERVING_API_TOKEN>
        export ANSIBLE_CHATBOT_INFERENCE_MODEL=<VLLM_SERVING_INFERENCE_MODEL>
        /bin/sh ansible-chatbot-run.sh

## Deploy

        kubectl apply -f ansible-chatbot-deploy.yaml

## Test (stack client)

        llama-stack-client --configure
        llama-stack-client distributions list
        llama-stack-client models list
        llama-stack-client inference chat-completion --message "tell me a joke"
        ...

## Test (stack container shell)

        # Obtain a container shell for the Ansible Chatbot Stack.
        docker run --security-opt label=disable -it --entrypoint /bin/bash ansible-chatbot:aap-<version>

## TODOs

- Kubernetes deployments
- Automate `~/.llama/distributions/ansible-chatbot/ansible-chatbot-run.yaml` generation as:
  - Comment-out / delete `external_providers_dir`
  - Change inference provider name/s
  - Register model/s
  - Register vector_dbs
- Shell scripts
  - Handle errors
  - Handle docker vs podman binaries
- Auth. (ANSIBLE_CHATBOT_STACK_API_TOKEN?)
- Export to quay.io/ansible
- CI Workflows