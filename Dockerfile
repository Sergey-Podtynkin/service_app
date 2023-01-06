FROM python:3.9-alpine3.16
#FROM python:3.9-centos

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000
RUN apk add postgresql-client build-base postgresql-dev

# Add none root user
RUN     apk add doas; \
        adduser --disabled-password service-adduser; \
        echo 'permit service-adduser as root' > /etc/doas.d/doas.conf


RUN pip install -r /temp/requirements.txt

USER service-adduser
#


# USER service-user

