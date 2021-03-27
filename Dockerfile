## FROM defines what base image to use to create the final Docker image.
FROM node:15.12.0-alpine3.10

## To avoid conflicts or trouble within the image file system, most images will use a directory relative to the BASE image structure.
WORKDIR /app

## Tells Docker what files to copy FROM (first .) your folder TO (second .) the final image. All COPYs are relative to WORKDIR
COPY ./package.json ./

## RUN is a command you want to run to add things to the image. Here we're running npm install to add all dependencies
RUN npm install

## The duplicate here is to prevent cache busting. Odds are your modules aren't going to change, and because there are sometimes several thousand modules, you want the first few steps to be cached, so that Docker only has to update actual code changes.
COPY . .

## This is the default command to run when an image is built and the container is started. This will commonly be "npm", "start", but in other situations you may want to start a server, open database pools, etc. This runs every time a container is started up. This is basically the on switch so you don't have a dead container.
CMD ["npm", "start"]