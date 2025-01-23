# Basis-Image für PostgreSQL
FROM postgres:latest

# Arbeitsverzeichnis setzen
WORKDIR /app

# Kopieren der Initialisierungs-Skripte
COPY init.sql /docker-entrypoint-initdb.d/

# Python installieren (falls benötigt)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Virtuelle Umgebung erstellen
RUN python3 -m venv /app/venv

# Abhängigkeiten installieren
COPY requirements.txt /app/
RUN /app/venv/bin/pip install -r /app/requirements.txt

ENV POSTGRES_CONFIG_FILE=/etc/postgresql/postgresql.conf

# Exponieren des Standard-PostgreSQL-Ports
EXPOSE 5432

# Standardbefehl für den Start von PostgreSQL
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
