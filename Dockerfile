# Use the official Python 3.9 image as a base
FROM python:3.9

# Create a non-root user
RUN groupadd -r myuser && useradd -r -g myuser myuser

# Set the working directory and change the ownership to the non-root user
WORKDIR /code
RUN chown -R myuser:myuser /code

# Switch to the non-root user
USER myuser

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Copy requirements file and install dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy your application code
COPY ./src /code/src

# Specify a port greater than 1024
CMD ["uvicorn", "src.application:app", "--host", "0.0.0.0", "--port", "8000"]
