#nginx latest image as base image
FROM nginx

#Create user & group
RUN groupadd -g 1010 nruser && \
    useradd -u 1010 -g nruser -m -s /sbin/nologin nruser

#Remove the not used default.conf
RUN rm /etc/nginx/conf.d/default.conf

#Copy the required ngnx.conf in the right place
COPY nginx.conf /etc/nginx/nginx.conf

#Copy the test index.html
COPY index.html /usr/share/nginx/html/index.html

#Provide the required access to the user for the required directories
RUN chown -R nruser:nruser /etc/nginx /usr/share/nginx/html /var/cache/nginx /var/run/

#Expose port, update the same in the nginx.conf
EXPOSE 8080

#Start container with user
USER nruser

#Start nginx
CMD ["nginx", "-g", "daemon off;"]
