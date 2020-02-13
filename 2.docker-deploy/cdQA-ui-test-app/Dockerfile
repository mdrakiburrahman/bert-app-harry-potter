# base image
FROM node:8.10.0

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package*.json ./
COPY load-dev-dependencies.js ./
COPY . .

RUN npm install
RUN npm install @vue/cli @vue/cli-service-global core-js
RUN npm install bootstrap-vue 

CMD ["npm", "run", "serve"]