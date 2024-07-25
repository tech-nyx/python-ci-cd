### Changes made 
1) changed the dependencies versions to make it compatible 
  
       . typing_extensions==4.5.0 ->   typing_extensions==4.8.0

       . starlette==0.36.2 -> starlette==0.35.0
2) also added health route to main.py file to enable probe in k8s deployment 



### Steps to run the docker container  

#### Step1: Build the docker  image first 
```bash 
docker build -t nyx-backend-python .
```

#### Step2 : Run the Docker Container

```bash 
docker container run -p 8080:8000 --name nyx-backend nyx-backend-python

```

### Step3: deploy in K8S Cluster 


```bash 

kubectl apply -f k8s/namespace.yaml 
kubectl apply -f k8s/service-account.yaml 
kubectl apply -f k8s/deployment.yaml 
kubectl apply -f k8s/hpa.yaml 
kubectl apply -f k8s/service.yaml 
```
