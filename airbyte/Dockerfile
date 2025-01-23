# Verwenden des offiziellen Ubuntu 20.04-Images als Basis
FROM ubuntu:20.04
#FROM docker:20.10.7-dind

# Umgebungsvariablen setzen
ENV DEBIAN_FRONTEND=noninteractive

# Installiere notwendige Abhängigkeiten
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    tzdata \
    sudo \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Füge den offiziellen Docker GPG-Schlüssel hinzu
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Füge das Docker-Repository hinzu
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Google-Key
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Füge den offiziellen Kubernetes GPG-Schlüssel hinzu
RUN sudo mkdir -p -m 755 /etc/apt/keyrings
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


# Installiere Docker und Docker-CLI
RUN apt-get update && apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    kubectl \
    && rm -rf /var/lib/apt/lists/

# Setze Docker-Daemon als Root-Benutzer
RUN usermod -aG docker root

# FIX in Dockerfile
RUN sed -i 's/ulimit -Hn 524288/ulimit -n 524288/g' /etc/init.d/docker

# Docker-Dienst starten (wird für abctl benötigt)
RUN service docker start

#Installiere kind
RUN curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.17.0/kind-linux-amd64 && \
    chmod +x /usr/local/bin/kind

# Kopiere die kubeconfig-Datei in das Docker-Image
COPY kubeconfig.yml /root/.kube/config

EXPOSE 8000 8001 8080

# Erstelle Kubernetes-Cluster mit kind
#RUN kind create cluster --name airbyte #-abctl

# Installieren von abctl
RUN curl -LsfS https://get.airbyte.com | bash -

# Lokale Installation von Airbyte
#RUN abctl local install

# Exponiere die Standardports für Airbyte

# Starte den Docker-Daemon
#CMD ["dockerd"]


###
#containerd	unix:///var/run/containerd/containerd.sock
#CRI-O	unix:///var/run/crio/crio.sock
#Docker Engine (using cri-dockerd)	unix:///var/run/cri-dockerd.sock