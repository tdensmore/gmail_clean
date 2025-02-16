FROM node:23-alpine AS builder

#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /app
COPY src/package*.json .
COPY src/index.js .
# COPY filterlist.txt .
RUN npm install
# RUN npm run build

## 

FROM node:23-alpine
COPY --from=builder /app/* .
EXPOSE 8080
CMD ["node", "index.js"]


# Production stage
# FROM nginx:latest
# COPY --from=builder /app/* /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]