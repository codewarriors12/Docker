# Use Alpine Linux as a base image
FROM alpine

LABEL maintainer="dp3cloud@gmail.com"

# Update and install Nginx
RUN apk update && apk upgrade && apk add --no-cache nginx
RUN rm /etc/nginx/http.d/default.conf
RUN rm /etc/nginx/nginx.conf
#RUN echo 'server { \
#    listen      80; \
#    server_name localhost; \
#    location / { \
#       root /usr/share/nginx/html; \
#    }\
#}' > /etc/nginx/http.d/default.conf
#COPY nginx.conf /etc/nginx/http.d/default.conf
#RUN mkdir -p /etc/nginx/conf.d
#COPY nginx.conf /etc/nginx/nginx.conf
#COPY myserver.conf /etc/nginx/conf.d/myserver.conf

# Create a directory for the HTML file
RUN mkdir -p /usr/share/nginx/html

# Create a custom HTML page
#RUN echo "This is index page created by dimple hosted via nginx server running in a container." > /usr/share/nginx/html/index.html
#RUN echo "This is index page created by dimple hosted via nginx server running in a container." > /var/lib/nginx/html/index.html
#RUN chmod 777 /var/lib/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html
RUN chmod 644 /usr/share/nginx/html/index.html
RUN chown nginx:nginx /usr/share/nginx/html/index.html


RUN mkdir -p /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf
COPY myserver.conf /etc/nginx/conf.d/myserver.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx with the "daemon off" option
CMD ["nginx", "-g", "daemon off;"]