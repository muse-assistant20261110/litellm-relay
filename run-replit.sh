#!/bin/bash
# Run the LiteLLM relay on Replit (free tier). Installs the proxy once
# (pip packages persist in the Repl), then serves on port 4000.
set -e
cd "$(dirname "$0")"
pip install --quiet "litellm[proxy]==1.110.1" 2>&1 | tail -n 1
export NO_PROXY=localhost,127.0.0.1
exec litellm --config config.yaml --port 4000
