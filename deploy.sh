docker build -t sswaminath/multi-client:latest -t sswaminath/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sswaminath/multi-server:latest -t sswaminath/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sswaminath/multi-worker:latest -t sswaminath/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sswaminath/multi-client:latest
docker push sswaminath/multi-server:latest
docker push sswaminath/multi-worker:latest

docker push sswaminath/multi-client:$SHA
docker push sswaminath/multi-server:$SHA
docker push sswaminath/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sswaminath/multi-server:$SHA
kubectl set image deployments/client-deployment client=stephengrider/multi-client:latest
kubectl set image deployments/worker-deployment worker=sswaminath/multi-worker:$SHA