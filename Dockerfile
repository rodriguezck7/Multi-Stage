# Use an official Python runtime as a base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements files into the container
COPY requirements.txt dev-requirements.txt /app/

# Install both production and development packages
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r dev-requirements.txt

# Collect static files
RUN python3 manage.py collectstatic --noinput

# Running migrations
RUN python3 manage.py migrate

# Copy the current directory contents into the container
COPY . /app/

# Run the Django app
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]