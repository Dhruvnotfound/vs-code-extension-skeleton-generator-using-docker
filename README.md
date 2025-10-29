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
   mkdir app  # yeoman will write the skeleton into this folder
   docker run -it --rm -v $(pwd)/app:/app --user $(id -u):$(id -g) dhruvnotfound/yeoman-vscode
   ```

   The generated skeleton will be placed into `$(pwd)/app`.

   This command will:
   - Run the Docker container with the Yeoman generator.
   - Bind your specified local directory to `/home/dockeruser` inside the container.
   - Invoke the Yeoman VS Code generator (`yo code`).
   - Prompt you for necessary information to generate the VS Code extension skeleton.

3. **Check the Generated Files**:

   After the process is complete, the generated files will be available in the directory you specified. You can now open the folder in VS Code and begin developing your extension.

## Dockerfile

The Dockerfile used in this repository will install Node.js, npm, the Yeoman generator and the VS Code extension generator.

## Notes

- You can modify the Dockerfile to include any additional dependencies you may need.
- If you encounter permission issues, ensure your Docker configuration allows volume mounting with the appropriate access rights. In above example, this is done using `--user $(id -u):$(id -g)`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
