FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
EXPOSE 3000
CMD ["node", "app.js"]

HEALTHCHECK --interval=10s --timeout=5s --retries=3 CMD curl -f http://localhost:3000/health || exit 1