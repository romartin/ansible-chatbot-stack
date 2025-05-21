#!/bin/sh
source venv/bin/activate
LLAMA_STACK_LOGGING=server=debug;core=info \
UV_HTTP_TIMEOUT=120 \
llama stack build --config ansible-chatbot-build.yaml --image-type container