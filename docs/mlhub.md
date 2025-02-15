# FOXDEN MLHub service

[MLHub](https://github.com/CHESSComputing/mlhub) service
is a proxy service for hosting various ML models and access
to inferences.

### API usage
```
# upload ML model
curl http://localhost:port/upload \
    -v -X POST \
    -H "Authorization: bearer $token" \
    -F 'file=@/path/model.tar.gz' \
    -F 'model=model' -F 'type=TensorFlow' -F 'backend=GoFake'

# list current models
curl http://localhost:port/models

# download specific model
curl http://localhost:port/models/<model_name>

# predict results for given model for provided file.json input
curl http://localhost:port/predict \
    -v -X POST \
    -H "Authorization: bearer $token" \
    -H "Accept: applicatin/json" \
    -H "Content-type: application/json" \
    -d@/path/input.json

where input.json has the form:
{"input":[1,2,3], "model": "model", "type": "TensorFlow", "backend": "GoFake"}

# upload MNIST model
curl http://localhost:port/upload \
    -v -X POST -H "Authorization: bearer $token" \
    -F 'file=@./mnist.tar.gz' \
    -F 'model=mnist' \
    -F 'type=TensorFlow' \
    -F 'backend=TFaaS'

# predict MNIST image
curl http://localhost:port/predict \
    -v -X POST -H "Authorization: bearer $token" \
    -F 'image=@./img1.png' \
    -F 'model=mnist' \
    -F 'type=TensorFlow' \
    -F 'backend=TensorFlow'

# delete existing model
curl http://localhost:port/delete
    -v -X DELETE \
    -H "Authorization: bearer $token" \
    -H "Content-type: application/json" \
    -d@/path/model.json

where model.json has the form:
{"model": "model", "type": "TensorFlow", "version": "latest"}

# get documentation
curl http://localhost:port/docs/docs
```
