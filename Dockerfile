FROM node:20-bookworm-slim

# System deps for Chromium
RUN apt-get update && apt-get install -y \
    wget ca-certificates \
    fonts-liberation \
    libnss3 libatk-bridge2.0-0 libatk1.0-0 \
    libcups2 libdrm2 libxkbcommon0 \
    libxcomposite1 libxdamage1 libxrandr2 \
    libgbm1 libasound2 libxshmfence1 \
    libpangocairo-1.0-0 libpango-1.0-0 \
    libgtk-3-0 libx11-xcb1 libxcb1 \
    libxext6 libxfixes3 libx11-6 \
 && rm -rf /var/lib/apt/lists/*

# Install n8n + playwright + chromium
RUN npm install -g n8n playwright \
 && npx playwright install chromium

ENV N8N_PORT=5678
EXPOSE 5678

CMD ["n8n"]
