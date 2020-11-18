from __future__ import print_function
import httplib2
import os
import auth


from datetime import datetime

from apiclient import discovery
from oauth2client import client
from oauth2client import tools
from oauth2client.file import Storage

from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import json
import requests


app = Flask(__name__)
CORS(app)

def get_labels():
    results = service.users().labels().list(userId='me').execute()
    labels = results.get('labels', [])

    if not labels:
        print('No labels found.')
    else:
        print('Labels:')
        for label in labels:
            print(label['name'])
# {id : john.teo.2018 , status: 1/0 , mod_name : ---}
@app.route("/notification/<string:input>")
def send_email(input):
    #appointment data send over through http invocation
    print(input)
    notification_details = []
    details = input.split("&")

    for param in details:
        temp = param.split("=")
        notification_details.append(temp[1])
    messageToStudent= ""

    try:
        import argparse
        flags = argparse.ArgumentParser(parents=[tools.argparser]).parse_args()
    except ImportError:
        flags = None
    
    import send_email
    SCOPES = 'https://mail.google.com/'
    CLIENT_SECRET_FILE = 'client_secret.json'
    APPLICATION_NAME = 'Gmail API Python Quickstart'
    authInst = auth.auth(SCOPES,CLIENT_SECRET_FILE,APPLICATION_NAME)
    credentials = authInst.get_credentials()

    http = credentials.authorize(httplib2.Http())
    service = discovery.build('gmail', 'v1', http=http)

    # different field declaration to send in the email
    student_name = notification_details[0]
    status = ""
    if(int(notification_details[1]) == 0):
        status = "Accepted"
    elif(int(notification_details[1]) == 1):
        status = "Rejected"
    mod_name = notification_details[2]



    messageToStudent = "Hi " + student_name +  ", this is a automated confirmation email from Book-A-Ta. \nYour application for " + mod_name + " has been " + status + ".\n Please do not reply to this email."
    print(messageToStudent)
    sendInst = send_email.send_email(service)
    message2 = sendInst.create_message_with_attachment('chengkg@gmail.com',student_name + "@smu.edu.sg",'Done',messageToStudent, '' )
    sendInst.send_message('me',message2)
    



    return jsonify({"message": "Email success"}), 201

if __name__ == '__main__':
    app.run(host ='0.0.0.0' , port=5100, debug=True)