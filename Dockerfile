# Build command : docker build -t jjveldscholten:portfolio 
# Run Command   : docker run -it -p 3001:3000 --name portfolio jjveldscholten:portfolio

FROM node:alpine

# set working directory
WORKDIR /app

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install deps
COPY package.json ./
COPY package-lock.json ./
RUN npm install 
RUN npm install react-scripts -g

# Copy Files to Docker
COPY . ./

# start app
CMD ["npm", "start"]