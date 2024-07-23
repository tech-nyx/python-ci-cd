# using latest  light-weight base image  of python 
FROM python:3.9-slim

#setting the work directory to /nyx-api/python
ENV APP_DIR /nyx-api/python
WORKDIR ${APP_DIR}

# copying the required files ingoring the files in .gitignore
COPY . .

# installing the dependencies 
RUN pip install -r requirements.txt 

# Declaring the enviornment variables 
ENV  stage development 

# Create a user to run the app
RUN useradd -ms /bin/bash nyx-python && chown -R nyx-python:nyx-python /nyx-api/python

# Switch to the non-root user
USER nyx-python

# Exposing the running port 
EXPOSE 8080 

# CMD to run the image 
CMD ["uvicorn","main:app" ,"--reload","--host", "0.0.0.0" ,"--port","8000"]