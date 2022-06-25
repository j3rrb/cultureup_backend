FROM node:16-slim

COPY dist .
EXPOSE 80

CMD [ "node", "dist/main" ]