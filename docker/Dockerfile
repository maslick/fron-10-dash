FROM node:8 as builder
COPY . /tmp
WORKDIR /tmp
RUN npm install && npm run build

FROM nginx
WORKDIR /usr/share/nginx/html/
COPY --from=builder /tmp/dist ./
COPY --from=builder /tmp/configure.sh ./
COPY --from=builder /tmp/nginx.sh ./
RUN chmod +x configure.sh
RUN chmod +x nginx.sh

CMD ./nginx.sh
