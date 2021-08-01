# Build command : docker build -t jjveldscholten/portfolio .
# Run Command   : docker run -it -p 3000:3000 --name portfolio jjveldscholten/portfolio
# Push Command  : docker push jjveldscholten/portfolio

# K8S for x86
#FROM node           
# K8S for ARM
FROM arm32v7/node   

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

# Expose port
EXPOSE 3000

# start app
CMD ["npm", "start"]