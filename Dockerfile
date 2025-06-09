# Use Python base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create app directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y gcc git default-libmysqlclient-dev && \
    pip install --upgrade pip

# Clone your GitHub repo (optional)
# Or copy from local
COPY . /app

# Install Python dependencies
RUN pip install flask pymysql boto3

# Expose app on port 80
EXPOSE 80

# Run the app
CMD ["python3", "app.py"]
