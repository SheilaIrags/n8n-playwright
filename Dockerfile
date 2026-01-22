FROM mcr.microsoft.com/playwright:v1.45.0-jammy

# Install n8n
RUN npm install -g n8n

ENV N8N_PORT=5678
EXPOSE 5678

CMD ["n8n"]
