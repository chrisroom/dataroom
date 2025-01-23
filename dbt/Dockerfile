FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt /app/requirements.txt

# Remove any existing virtual environment
RUN rm -rf /app/venv

# Create the virtual environment
RUN python3 -m venv /app/venv


# Activate the virtual environment and install dependencies
RUN pip install --upgrade pip && pip install -r /app/requirements.txt
#RUN /app/venv/bin/pip install --upgrade pip && /app/venv/bin/pip install -r /app/requirements.txt

# Copy project files
COPY . /app/

# Copy DBT profiles.yml to the appropriate location
COPY profiles.yml /root/.dbt/profiles.yml

# Expose port for DBT usage (if needed)
EXPOSE 8080

#ENV PATH="/app/venv/bin:$PATH"

# Set default command to dbt
#CMD ["/app/venv/bin/dbt", "--version"]
#CMD ["dbt", "--version"]
ENTRYPOINT ["dbt", "--version"]