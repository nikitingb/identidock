FROM python

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install flask uwsgi requests redis
WORKDIR /app
COPY app /app
RUN chmod 755 cmd.sh
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]