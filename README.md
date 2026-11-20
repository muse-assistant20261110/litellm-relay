# AI Relay Station (LiteLLM Proxy)

One OpenAI-compatible endpoint + one master token, with failover across free AI providers.

## Use

Base URL: the Render service URL (see deployment). Auth: `Authorization: Bearer <LITELLM_MASTER_KEY>`.

```bash
curl $RELAY_URL/v1/chat/completions \
  -H "Authorization: Bearer $LITELLM_MASTER_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"chat","messages":[{"role":"user","content":"hello"}]}'
```

Models: `chat` (default), `cohere-command-r7b`, `cohere-command-r`, `cohere-command-r-plus`.
Fallbacks: command-r7b -> command-r -> command-r-plus.

## Deploy

Render web service (Docker) from this repo. Env vars set in Render (never in git):
`LITELLM_MASTER_KEY`, `COHERE_API_KEY`. DeepSeek key is excluded (account balance $0).
Local dev: `./start.sh` (needs `.env` with the same vars; venv at `.venv`).

## Providers (2026-11-20)

Working: Cohere trial key (1,000 calls/month). Blocked: Groq (signup_blocked on Proton
mailboxes), OpenRouter (network block), Cloudflare/Fireworks/Novita/SiliconFlow/Railway
(Turnstile), Zhipu/PPIO (phone-only), Mistral (key needs paid upgrade), DeepSeek ($0 balance),
HF Spaces (Docker needs PRO).
