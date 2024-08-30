# Use an official Python runtime as a parent image
FROM ubuntu:latest 
# Set the working directory in the container
WORKDIR /app
ARG PYVER="3.12"
ENV TZ=US/Pacific \
    DEBIAN_FRONTEND=noninteractive
ARG GITUN="Adithya Shankar"
ARG GITEMAIL="adithya7shankar@gmail.com"
# Copy the current directory contents into the container at /app
COPY . /app
RUN apt update
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get install -y python$PYVER \
    python3-pip
# Install any needed packages specified in requirements.txt
RUN apt-get install -y git-all
# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python3-venv \
    python3-pip \
    git-all \
    python3-cryptography \
    python3-opencv \
    python3-matplotlib \
    python3-pandas \
    python3-numpy \
    python3-scipy \
    python3-sklearn \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install packages
RUN /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install tensorflow[cuda] keras torch

ENV PATH="/opt/venv/bin:$PATH"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y upgrade && \
    apt-get install -y python3-pip
RUN git config --global user.name "$GITUN" &&\
    git config --global user.email "$GITEMAIL" &&\
    git config --global init.defaultBranch main
#Make port 80 available to the world outside this container
COPY . /app
EXPOSE 80

# Run main.py when the container launches
CMD ["python", "main.py"]

