FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt /app/requirements.txt

# Remove any existing virtual environment
RUN rm -rf /app/venv

# Create and activate virtual environment
RUN python3 -m venv /app/venv

# Install dependencies inside the virtual environment
#RUN /app/venv/bin/pip install --upgrade pip && /app/venv/bin/pip install -r /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt
#RUN pip install --upgrade pip && pip install virtualenv && virtualenv venv && ./venv/bin/pip install -r requirements.txt

# Setze Dagster-Home (optional, falls verwendet)
ENV DAGSTER_HOME=/app/dagster_project

# Copy the rest of the application
COPY . /app

# Expose ports and set the entry point
EXPOSE 3000

#ENV PATH="/app/venv/bin:$PATH"

#CMD ["/app/venv/bin/dagit", "-h", "0.0.0.0", "-p", "3000"]
CMD ["dagit", "-h", "0.0.0.0", "-p", "3000"]
#CMD ["/bin/bash", "-c", "source /app/venv/bin/activate && dagit -h 0.0.0.0 -p 3000"]

