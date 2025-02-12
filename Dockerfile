# Use an official Python image
FROM python:3.10

# Set working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y nginx

# Copy application files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Start both Nginx and FastAPI
CMD service nginx start && gunicorn -w 4 -k uvicorn.workers.UvicornWorker main:app --bind 0.0.0.0:8000
