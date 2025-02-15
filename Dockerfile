FROM python:3.8-slim

# Set environment variables
ENV DJANGO_SETTINGS_MODULE='hospitalmanagement.settings'

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8000
EXPOSE 8000

# Run command to start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

