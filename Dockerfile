
FROM python:3.8-slim-buster  # Using the Python 3.8 slim version of the buster image

RUN apt update && apt upgrade -y  # Updating and upgrading all packages
RUN apt install git -y  # Installing git to clone the project repository
COPY requirements.txt /requirements.txt  # Copying the requirements.txt file into the container

RUN mkdir /LazyPrincess/  # Creating a new directory called LazyPrincess
WORKDIR /LazyPrincess/  # Setting the working directory to /LazyPrincess

RUN pip3 install -U pip && pip3 install -U -r requirements.txt  # Upgrading pip and installing project dependencies
                          # The -U flag is used to upgrade the pip package before installing the project dependencies

COPY . /LazyPrincess/  # Copying everything from the current directory to the /LazyPrincess directory in the container
COPY start.sh /start.sh  # Copying the start.sh script to the root directory of the container

CMD ["/bin/bash", "/start.sh"]  # Running the start.sh script using /bin/bash as the interpreter
EXPOSE 8080/tcp  # Exposing port 808 for0 communication with the container
