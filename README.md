# Docker installation

![Ubuntu version](https://img.shields.io/badge/Ubuntu-18.04-orange.svg?style=flat)
![Docker version](https://img.shields.io/badge/Docker-19.03.6-blue.svg?style=flat)

## Documentation Content

- [System Requetiments](#system-requirements)
- [Getting Started](#getting-started)
  - [Running Locally](#running-locally)
  - [Running Tests](#running-tests)
- [Common Mistakes](#common-mistakes)

## System Requirements

These are the dependencies that will be needed to install the docker

- Ubuntu Server >= 18.04
- Git

## Getting Started

To start clone the repository:

```sh
git clone https://github.com/Kledenai/docker-installation.git
```

### Running With Scripts

This is a more automatic way to install the docker, running this code in your server.

```bash
sudo ./install.sh
```

obs: you have to be inside the root folder of that repository.

After the script finishes running everything it needs, run the following command to check if the docker is installed correctly.

```bash
sudo docker version
```

### Running Manually

This is the manual form, there are a few more steps, but you can check each step by step and better understand what is happening

if you have an old docker installation run the following command

```bash
sudo apt-get -y remove docker docker-engine docker-cli docker-ce-cli docker.io
```

in case you have already installed the docker with the snap on your machine, run the following command:

```bash
sudo snap remove docker
```

Update all linux packages

```bash
sudo apt-get update
```

start docker installation

```bash
sudo apt-get -y install docker.io
```

Start docker service in the machine

```bash
sudo systemctl start docker
```

Now enable the docker on the server

```bash
sudo systemctl enable docker
```

Need to increase the value of the map count, run this command below

```bash
sudo sysctl -w vm.max_map_count=262144
```

if everything went well, run the command below to verify that both the client and the docker engine are installed

```bash
sudo docker version
```

## Common Mistakes

It is very common for some errors to occur during installation

Having said that, I went through these errors which I will list here and will pass the solution on to them below

#### 1º Error

```error
docker.io : Depends: containerd (>= 1.2.6-0ubuntu1~)
E: Unable to correct problems, you have held broken packages.
```

###### solution:

```bash
sudo apt-get remove containerd.io
```

#### 2º Error

```error
Failed to start docker.service: Unit docker.service is masked.
```

###### solution:

```bash
sudo systemctl unmask docker
```
