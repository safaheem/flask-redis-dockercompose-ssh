FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt

RUN apk add openssh \
     && echo "root:Docker!" | chpasswd 

COPY sshd_config /etc/ssh/

EXPOSE 80 2222

RUN /usr/bin/ssh-keygen -A 

#CMD ["python", "app.py"]

ENTRYPOINT ["./init_container.sh"]