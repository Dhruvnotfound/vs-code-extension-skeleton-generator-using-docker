FROM node:16

WORKDIR /app

# Installing Yeoman and the VS Code Extension generator
RUN npm install -g yo generator-code
RUN npm install -g stream

# Creating a non-root user
RUN useradd -m dockeruser
USER dockeruser

ENTRYPOINT ["yo"]

CMD ["code"]