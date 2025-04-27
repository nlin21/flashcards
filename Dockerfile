FROM node:23-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:23-alpine AS runner
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000
CMD ["npm", "start"]