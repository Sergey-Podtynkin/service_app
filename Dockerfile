FROM python:3.9-alpine3.16
#FROM python:3.9-centos

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000

# Add none root user
# RUN adduser --disabled-password service-adduser
RUN     apk add doas; \
        adduser --disabled-password service-adduser; \
        echo 'permit service-adduser as root' > /etc/doas.d/doas.conf
# USER baeldung


RUN pip install -r /temp/requirements.txt

USER service-adduser
#


# USER service-user

