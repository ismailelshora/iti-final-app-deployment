# iti-final project #


## deploy-app-GKE ##
Now after setting up the jenkins pods and grant him the needed permission, i can create my pipeline to build the application and push the image to my dockerhub then deploy it on the cluster. So i am gonna explain that in steps

## build Dockerfile for app ##

![dockerfile](https://user-images.githubusercontent.com/86315031/182553784-9e72b71c-df56-44ad-b344-7581381205fa.png)


## Creating my app yaml files ##

1)namespace for deploying app on the same cluster

![1](https://user-images.githubusercontent.com/86315031/182554998-084fb9cc-ae31-49fc-a4c8-c69252d8cacb.png)

2) deploymet yaml file

![dep](https://user-images.githubusercontent.com/86315031/182554627-78429c07-aea4-4f4b-857c-02bb33133565.png)

3) service yaml file

![1](https://user-images.githubusercontent.com/86315031/182555253-6a0b9eb5-cbe2-445e-b013-b9a3c2b7f440.png)

## create pipline ##

1) name of pipeline and pipeline 

![1](https://user-images.githubusercontent.com/86315031/182556092-70d6da06-426f-4a48-bab5-192cee8cb165.png)

2) github link and scm 

![1](https://user-images.githubusercontent.com/86315031/182556697-b88c059f-5674-4f3b-8e2a-0248af470caa.png)

3)Authorize jenkins to push image to dockerhub rebo

![1](https://user-images.githubusercontent.com/86315031/182557849-d7da0ea2-e028-4aec-909a-32609f7ceb64.png)


4) jenkinsfile 

![1](https://user-images.githubusercontent.com/86315031/182557119-14ace8af-8e37-4bcb-b375-d4f09f3f60fc.png)

## build this pipeline ##

1) from jenkins dashboard 

![mypipline](https://user-images.githubusercontent.com/86315031/182558326-9396078d-8036-4f07-9abd-6860c96cdbd3.png)

2) go to bastion sever and take server ip

![1](https://user-images.githubusercontent.com/86315031/182559375-0f90019a-61d3-43cb-99d6-9e16d3da6099.png)

3) external ip and port from service deploy namespace

![frombrawoser](https://user-images.githubusercontent.com/86315031/182559703-90f00148-7894-46ce-987b-a96a0f5f633e.png)








