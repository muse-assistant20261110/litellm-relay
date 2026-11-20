FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY config.yaml .
# Env vars (LITELLM_MASTER_KEY, COHERE_API_KEY, ...) are set in the Railway
# dashboard / `railway variables`, never baked into the image. .env is NOT copied.
CMD ["sh", "-c", "litellm --config config.yaml --port ${PORT:-4000}"]
