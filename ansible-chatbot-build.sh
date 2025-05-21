#!/bin/sh
source venv/bin/activate
LLAMA_STACK_VERSION=$(pip show llama-stack | grep Version | cut -c 10-)
ANSIBLE_CHATBOT_VERSION=aap-$LLAMA_STACK_VERSION
docker build -f ContainerFile -t ansible-chatbot:$ANSIBLE_CHATBOT_VERSION --build-arg VECTOR_DB_STORE=aap_faiss_store.db --build-arg LLAMA_STACK_VERSION=$LLAMA_STACK_VERSION .