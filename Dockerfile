# Start by pulling the python image
FROM python:3.9-alpine

# Copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# Switch working directory
WORKDIR /app

# Install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# Copy every content from the local file to the image
COPY . /app

# Run Flask
# You need to specify host as 0.0.0.0 because by default Flask binds to
# 127.0.0.1; specifying `docker run -p 5000:5000` will bind 127.0.0.1:5000
# on the host and 0.0.0.0:5000 in the container. So without specifying host
# as 0.0.0.0, you won't be able to communicate with your Flask app.
CMD ["flask", "run", "--host=0.0.0.0"]
