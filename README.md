## - GCP-Final-Task
## - LoadBalancer:  34.89.68.66:8000 
## - Technologies:
### 1) Google CLoud Platform
### 2) terraform
### 3) Docker Platform
### - Goal is to dockarize python web application with redis and deploy it on GKE
## - Steps
### 1) i created the infrastructre using terraform. check infrastructure folder.
### 2) i pulled the sourced code from github 
### 3) i worked on building the dockerfile to create an image of this file and here i changed the tornado dependency to 6.1.0 because the older version 
### in the requirements.txt doesnt work. 
### 4) i pulled the redis image from dockerhub
### 5) both images are pushed into GCR registry
### 6) The i created 4 yaml files
### - first one is for the application
### - second is for the redis database
### - third is to make a clusterip service so that the app can connect to the redis internally in the cluster
### - fourth is for the loadbalancer service.
### 7) I deployed the my app the cluster and i can access it through the loadbalancer 


