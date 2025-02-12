# Use official Python image
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy application code
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt update && apt install -y nginx

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose FastAPI and Nginx ports
EXPOSE 80 8000

# Start both Nginx and FastAPI
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
