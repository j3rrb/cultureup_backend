FROM node:16-slim

COPY . .
RUN yarn

EXPOSE 3000

CMD [ "yarn", "start:dev" ]