# Instructions copied from - https://hub.docker.com/_/python/
FROM python:3-onbuild

# tell the port number the container should expose
EXPOSE 5000

# run the command
CMD ["python3.6", "./main_facerec_multiprocess.py"]
