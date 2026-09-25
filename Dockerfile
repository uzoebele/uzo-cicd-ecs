# 1. Start from an official, small Linux image that already has Node.js
FROM node:24-alpine

# 2. Tell Node this is production, and which port to use
ENV NODE_ENV=production PORT=3000

# 3. Create and move into the /app folder inside the container
WORKDIR /app

# 4. Copy your files from the laptop into the container
COPY package.json ./
COPY src/ ./src/

# 5. Stop running as the all-powerful root user
USER node

# 6. Document which port the app listens on
EXPOSE 3000

# 7. Docker checks the app's pulse every 30 seconds
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/health || exit 1

# 8. The command that starts the app
CMD ["node", "src/server.js"]