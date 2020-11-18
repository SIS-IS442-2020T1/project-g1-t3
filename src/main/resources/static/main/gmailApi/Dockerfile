FROM python:3
WORKDIR /usr/src/app
# COPY requirements.txt ./
COPY . .
RUN pip install httplib2
RUN pip3 install --upgrade oauth2client
RUN pip install --upgrade google-api-python-client oauth2client
RUN pip install --no-cache-dir -r requirements.txt
COPY ./notification_service.py .
# ADD . /path/inside/docker/container



CMD [ "python", "./notification_service.py" ]

