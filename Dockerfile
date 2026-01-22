FROM n8nio/n8n:latest

USER root

RUN npm install -g playwright \
 && npx playwright install chromium \
 && npx playwright install-deps

USER node

