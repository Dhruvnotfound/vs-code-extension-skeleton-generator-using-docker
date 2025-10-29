FROM node:25

WORKDIR /app

# Installing Yeoman and the VS Code Extension generator
RUN npm install -g yo generator-code
RUN npm install -g stream

# Creating a non-root user
RUN useradd -m dockeruser
# The following line is required to avoid "EACCES: permission denied, mkdir '/app/xyz'"
RUN chown dockeruser /app
USER dockeruser

ENTRYPOINT ["yo"]

CMD ["code"]