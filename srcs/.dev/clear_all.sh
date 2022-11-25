docker stop $(docker ps -qa) >/dev/null 2>&1
docker rmi -f $(docker images -qa) >/dev/null 2>&1
sudo docker rm $(sudo docker volume ls -q) >/dev/null 2>&1
sudo docker system prune -af >/dev/null 2>&1
sudo docker volume rm $(sudo docker volume ls -q) >/dev/null 2>&1 >/dev/null 2>&1
