FROM guggero/openshift-nginx

COPY conf.d/default.template /etc/nginx/conf.d/default.template

USER root

RUN yum -y install gettext

RUN mkdir -p /home/nginx
COPY start.sh /home/nginx/start.sh
RUN chmod a+w /etc/nginx/conf.d/default.conf
RUN chmod +x /home/nginx/start.sh

USER 998

EXPOSE 8080

CMD ["/bin/bash", "/home/nginx/start.sh"]
