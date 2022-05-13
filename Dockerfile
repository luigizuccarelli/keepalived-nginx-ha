FROM docker.io/library/nginx 
COPY conf.d/* /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY www/ /usr/share/nginx/html/
COPY uid_entrypoint.sh /usr/local/bin/
RUN mkdir -p /tmp/log/nginx && mkdir -p /tmp/cache/nginx   
RUN chmod -R 777 /tmp/log/nginx && chmod -R 777 /tmp/cache/nginx   

EXPOSE 8080 

#USER 1001
ENTRYPOINT [ "/usr/local/bin/uid_entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]
