FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y python python-dev build-essential

# ADD https://bootstrap.pypa.io/get-pip.py /tmp/
ADD ./files/get-pip.py /tmp/
RUN python /tmp/get-pip.py

# Copy and install app
RUN apt-get install -y python-dev
# Install uwsgi ahead of time so that rebuilds are a little faster
RUN pip install uwsgi

RUN mkdir /hello_world
ADD ./hw /hello_world
WORKDIR /hello_world
RUN pip install -e .

RUN apt-get purge -y build-essential

EXPOSE 9090

RUN touch /tmp/reload

ENTRYPOINT  ["uwsgi", "--http", ":9090", "--master", "-w", "hello_world.hello_world:application"]
CMD []