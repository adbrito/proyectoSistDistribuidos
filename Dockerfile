FROM node:14
RUN mkdir -p /home/ubuntu/prueba/node_modules && chown -R node:node /home/ubuntu/prueba
WORKDIR /home/ubuntu/prueba
# RUN ENV=${ENV}
# ENV MYSQL_ROOT_PASSWORD root1234
# ENV MYSQL_DATABASE gamesplatform
# ENV MYSQL_USER root
# ENV MYSQL_HOST localhost

COPY package*.json ./
#COPY yarn.lock .
#COPY .env .

RUN yarn install
COPY . .
RUN yarn build

EXPOSE 3000
EXPOSE 3036

CMD [ "npm", "start"]