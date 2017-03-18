FROM buildpack-deps:jessie

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 7.7.3

RUN curl -SLO "http://npm.taobao.org/mirrors/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

WORKDIR /var/www/nodeserver

#RUN  npm install socket.io --registry=https://registry.npm.taobao.org
#RUN  npm install mysql --registry=https://registry.npm.taobao.org
#RUN  npm install ioredis --registry=https://registry.npm.taobao.org

RUN npm install --registry=https://registry.npm.taobao.org

CMD ["npm", "start"]

EXPOSE 8000