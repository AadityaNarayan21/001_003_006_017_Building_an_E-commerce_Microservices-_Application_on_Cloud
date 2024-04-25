# IN root folder

docker build -t uc1 ./uc1
docker build -t uc2 ./uc2
docker build -t uc3 ./uc3

#only this in frontend folder
docker build -t frontend .

#backt to root

docker tag uc1 abhayr1/uc1:latest
docker tag uc2 abhayr1/uc2:latest
docker tag uc3 abhayr1/uc3:latest
docker tag frontend abhayr1/frontend:latest

docker push abhayr1/uc1:latest
docker push abhayr1/uc2:latest
docker push abhayr1/uc3:latest
docker push  abhayr1/frontend:latest

kubectl apply -f kubernetes.yaml