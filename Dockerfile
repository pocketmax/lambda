FROM node:9.11.2-alpine
#RUN apk update && apk upgrade
#RUN apk add nmap
#COPY entrypoint.sh /
#RUN chmod 775 /entrypoint.sh
#RUN mkdir /app
#WORKDIR /app
COPY app.js /app/app.js
COPY fn /app/fn
WORKDIR /app/fn
RUN yarn install


#ENTRYPOINT ["/entrypoint.sh"]
CMD ["node","/app/app.js"]
#EXPOSE 443