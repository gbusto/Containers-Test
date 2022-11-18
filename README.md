# Overview
Simple Python app to test Docker and Kubernetes

## Notes
I learned that you must specify Flask to run on 0.0.0.0 with the `--host` argument as opposed to it's default 127.0.0.1 binding. Otherwise you won't be able to reach the Flask app inside the container.

## Commands
How to build, run, and test this flask app.
```
# Create the image to use in containers
docker image build -t k8s_test .

# Run the image
docker run -p 5000:5000 -d k8s_test

# Visit http://127.0.0.1:5000/test in your browser
```

How to manage and interact with your running app in the container:
```
# List all containers
docker container ls -a

# Execute a command in the container to test things out
docker container exec <CONTAINER_ID> ls -la

# Stop a running container
docker container stop <CONTAINER_ID>

# Remove a container (must stop the container before you can remove it)
docker container rm <CONTAINER_ID>
```

## Interact with the app
Once the app is running in the container, visit `http://127.0.0.1:5000/test` and you'll get output that looks like this: `{"test":true,"time":"2022-11-18 14:35:19.382765"}`.

All it does is return a JSON object with a `test` key and a `time` key that specifies the current time on the machine.

## Test the app without Docker
Run the following commands:
```
# Create a Python virtual environment
python3 -m venv myenv

# Enter your virtual environment
source myenv/bin/activate

# Install requirements
pip3 install -r requirements.txt

# Run Flask
flask run

# Visit http://127.0.0.1:5000/test in your browser
```
