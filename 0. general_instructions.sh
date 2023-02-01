# Before starting the evaluation
sudo docker stop $(sudo docker ps -qa); sudo docker rm $(sudo docker ps -qa); sudo docker rmi -f $(sudo docker images -qa); sudo docker volume rm $(sudo docker volume ls -q); sudo docker network rm $(sudo docker network ls -q) 2>/dev/null
