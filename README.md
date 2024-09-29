# VS Code Extension Skeleton Generator with Docker

This repository provides a Dockerized solution to generate a VS Code extension skeleton using the Yeoman generator. It allows you to create extension templates without needing to install Node.js, npm, or Yeoman on your local machine.

## Features

- No local installation of Node.js, npm, or Yeoman required.
- Fully Dockerized environment to run the Yeoman generator.
- Easily generate a VS Code extension template directly into your local folder.

## Prerequisites

- Docker installed on your local machine.

## Usage

Follow these steps to generate a VS Code extension skeleton:

1. **Pull the Docker image from DockerHub** or **Build the image locally**:

   To pull the image from DockerHub, run:
   ```bash
   docker pull dhruvnotfound/yeoman-vscode:latest
   ```

   Or, to build the Docker image locally, run:
   ```bash
   docker build -t vscode-extension-generator .
   ```

2. **Generate the Extension Skeleton**:

   To generate a VS Code extension skeleton, run the following command:
   ```bash
   docker run -it --rm -v /path/to/your/directory:/home/dockeruser yeoman-vscode
   ```

   Replace `/path/to/your/directory` with the path to the local folder where you want the generated files to be placed.

   This command will:
   - Run the Docker container with the Yeoman generator.
   - Bind your specified local directory to `/home/dockeruser` inside the container.
   - Invoke the Yeoman VS Code generator (`yo code`).
   - Prompt you for necessary information to generate the VS Code extension skeleton.

3. **Check the Generated Files**:

   After the process is complete, the generated files will be available in the directory you specified. You can now open the folder in VS Code and begin developing your extension.

## Dockerfile

Below is the Dockerfile used in this repository. It installs Node.js, npm, the Yeoman generator, and the VS Code extension generator.

```Dockerfile
FROM node:16

# Set the working directory
WORKDIR /app

# Install Yeoman and the VS Code Extension generator
RUN npm install -g yo generator-code
RUN npm install -g stream

# Create a non-root user
RUN useradd -m dockeruser
USER dockeruser

# Default command to run the VS Code extension generator
CMD ["yo", "code"]
```

## Notes

- You can modify the Dockerfile to include any additional dependencies you may need.
- If you encounter permission issues, ensure your Docker configuration allows volume mounting with the appropriate access rights.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
