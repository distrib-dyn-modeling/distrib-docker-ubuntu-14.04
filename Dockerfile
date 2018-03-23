FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install wget python2.7 python-dev git gcc
RUN apt-get -y install build-essential

# GET PIP
RUN cd /tmp
RUN wget https://bootstrap.pypa.io/get-pip.py

# Install PIP
RUN python get-pip.py

# Installing required components
# RUN pip install libroadrunner antimony

COPY requirements.txt /
# RUN pip install -r /requirements.txt
RUN pip install --upgrade -r /requirements.txt
RUN pip install --upgrade rrplugins==1.1.10

RUN python -c 'import antimony; print(antimony.__path__)'
RUN python -c 'import roadrunner; print(roadrunner.__path__)'

COPY importer.py /
RUN python importer.py

# RUN ldd /usr/local/lib/python2.7/dist-packages/roadrunner/_roadrunner.so