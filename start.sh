#!/bin/bash
# Start the LiteLLM relay proxy. Keys come from .env (mode 600) in this dir.
# The VM's default no_proxy list contains bracketed IPv6 entries ([::1]) that
# break httpx inside LiteLLM ("Invalid port: ':1]'"), so override it here.
set -e
cd "$(dirname "$0")"
set -a
. ./.env
set +a
export NO_PROXY=localhost,127.0.0.1
export no_proxy=localhost,127.0.0.1
exec ./.venv/bin/litellm --config config.yaml --port 4000
