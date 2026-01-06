# STAGE 1: builder
FROM node:22.1-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .
RUN yarn build

# STAGE 2: runtime
FROM node:22.1-alpine

WORKDIR /app

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001 -G nodejs

RUN yarn global add serve

COPY --from=builder /app/build ./build

RUN chown -R nodejs:nodejs /app
USER nodejs

EXPOSE 3000

CMD ["serve","-s", "build"]
