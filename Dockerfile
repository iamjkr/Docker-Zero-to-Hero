# Use the latest version of Python as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Install required packages
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    postgresql-client

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the required packages from the requirements file
RUN pip install -r requirements.txt

# Copy the rest of the application files to the container
COPY . .

# Set environment variables for Django
ENV DJANGO_SETTINGS_MODULE=myproject.settings

# Expose port 8000 for the Django development server
EXPOSE 8000

# Set the command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
