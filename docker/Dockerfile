FROM node:8 as builder
COPY . /tmp
WORKDIR /tmp
RUN npm install && npm run build

FROM nginx
COPY --from=builder /tmp/src /usr/share/nginx/html
COPY --from=builder /tmp/configure.sh /usr/share/nginx/html
COPY --from=builder /tmp/nginx.sh /usr/share/nginx/html
RUN chmod +x /usr/share/nginx/html/configure.sh
RUN chmod +x /usr/share/nginx/html/nginx.sh

WORKDIR /usr/share/nginx/html/
CMD ./nginx.sh
