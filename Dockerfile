# from which image you want to extend
FROM node:8.11.3-alpine AS dev
# RUN mkdir XD
#expose port 3000 of the image
EXPOSE 3000
# set work directory and if it doesnt exists it will be created
WORKDIR /usr/src/app
#make a env variable and set it to development
ENV NODE_ENV development
#copy files from local to our container
COPY . .
# install desired dependencies
RUN npm install

FROM node:8.11.3-alpine AS runtime
#expose port 3000 of the image
EXPOSE 3000
# RUN mkdir Xd1
WORKDIR /usr/src/app
#make a env variable and set it to development
ENV NODE_ENV production
#copy files from local to our container
COPY . .
# install desired dependencies
RUN npm install
#run command, ENTRYPOINT RUNS BEFORE CMD
CMD ["node","calculator.js"]
