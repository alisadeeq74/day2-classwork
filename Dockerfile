#build the app

FROM node:alpine as build (as last push 6 days ago)

WORKDIR /app

COPY package*.json ./
 
RUN npm install

COPY . .

RUN npm run build

#stage 2: render app with nginx

FROM nginx:alpine 


COPY --from=build /app/dist /usr/share/nginx/html dest


EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]

