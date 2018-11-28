FROM node:9.11.2-alpine
#RUN apk update && apk upgrade
#RUN apk add nmap
#COPY entrypoint.sh /
#RUN chmod 775 /entrypoint.sh
#RUN mkdir /app
#WORKDIR /app
COPY app.js /app.js
COPY fn.js /fn.js
#WORKDIR /app/src
#RUN yarn install


#ENTRYPOINT ["/entrypoint.sh"]
CMD ["node","/app.js"]
#EXPOSE 443