FROM node:24-alpine

WORKDIR /app

COPY . ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Build the production bundle
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN yarn build

# Set environment variables
ENV NODE_ENV=production

EXPOSE 3000

CMD ["yarn", "start"]
