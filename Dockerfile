FROM node:18.19.0
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node package*.json .
# COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8082
CMD [ "node", "app.js" ]