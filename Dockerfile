FROM node:20-alpine AS base

RUN apk add --no-cache libc6-compat

WORKDIR /app

# 1. Copy the files you created on GitHub

COPY package.json package-lock.json* ./

# 2. Install everything (the shared node_modules)

RUN \

  if [ -f package-lock.json ]; then npm ci; \

  else npm install; \

  fi

# 3. Stop here! 

# This image now lives in your registry with /app/node_modules ready to go.
