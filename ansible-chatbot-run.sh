#!/bin/sh
source venv/bin/activate
LLAMA_STACK_VERSION=$(pip show llama-stack | grep Version | cut -c 10-)
ANSIBLE_CHATBOT_VERSION=aap-$LLAMA_STACK_VERSION
docker run --security-opt label=disable -it -p 8321:8321 \
  --env LLAMA_STACK_PORT=8321 \
  --env VLLM_URL=$ANSIBLE_CHATBOT_VLLM_URL \
  --env VLLM_API_TOKEN=$ANSIBLE_CHATBOT_VLLM_API_TOKEN \
  --env INFERENCE_MODEL=$ANSIBLE_CHATBOT_INFERENCE_MODEL \
  --env ANSIBLE_CHATBOT_IMAGE_TAG=$ANSIBLE_CHATBOT_VERSION \
  --env SQLITE_STORE_DIR=/.llama/distributions/ansible-chatbot \
  -v ./ansible-chatbot-run.yaml:/app/run.yaml \
  ansible-chatbot:$ANSIBLE_CHATBOT_VERSION \
  --config /app/run.yaml
