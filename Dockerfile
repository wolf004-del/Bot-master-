FROM python:3.8-slim-buster



RUN apt update && apt upgrade -y

RUN apt install git -y

COPY requirements.txt /requirements.txt

RUN pip install -U pip && pip install -U -r requirements.txt
# Replaced "pip3" with "pip" since the base image uses Python 3.10
# Removed the extra pip install command as it is unnecessary


RUN cd /
RUN mkdir /LazyPrincess

WORKDIR /LazyPrincess
COPY start.sh /start.sh

# Copy all files to the /Eva directory inside the container
COPY . .

# Set the command to be executed when the container starts
CMD ["/bin/bash", "/start.sh"]
EXPOSE 8080/tcp  # Exposing port 808 for0 communication with the container
