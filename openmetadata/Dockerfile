# Verwenden Sie ein offizielles Python-Image als Basis
#FROM python:3.10-slim
FROM ubuntu:20.04

# Arbeitsverzeichnis im Container festlegen
#WORKDIR /app

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin apt-get install -y \
   # tzdata \
    libpq-dev \
    ca-certificates \
    sudo \
    software-properties-common \
    python3 \
    python3-venv \
    python3-pip \
    openjdk-11-jre \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Kopieren Sie die requirements.txt in das Arbeitsverzeichnis
COPY requirements.txt /app/

# Erstellen Sie eine virtuelle Umgebung
#RUN python -m venv venv

# Setze die Umgebungsvariable für Java
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Arbeitsverzeichnis im Container
WORKDIR /app

# Aktivieren Sie die virtuelle Umgebung und installieren Sie die Abhängigkeiten
RUN pip install --upgrade pip && pip install --no-cache-dir -r /app/requirements.txt

# Kopieren Sie den Rest des Anwendungscodes in das Arbeitsverzeichnis
COPY . /app/

# Setzen Sie die Umgebungsvariable, um die virtuelle Umgebung zu aktivieren
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

#CMD ["java", "-jar", "openmetadata-server.jar"]