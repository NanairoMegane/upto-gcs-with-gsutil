#!bin/bash

JSONPATH="./config/key.json"
gcloud auth activate-service-account --key-file $JSONPATH