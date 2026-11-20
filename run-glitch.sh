#!/bin/bash
# Run the LiteLLM relay on Glitch (free tier). Installs the proxy once
# (packages persist in the project), then serves on $PORT (default 3000).
set -e
cd "$(dirname "$0")"
pip install --quiet "litellm[proxy]==1.110.1" 2>&1 | tail -n 1
export NO_PROXY=localhost,127.0.0.1
exec litellm --config config.yaml --port ${PORT:-3000}
