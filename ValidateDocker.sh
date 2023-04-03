# After sshing into each EC2 (node), run Below commands to confirm that docker
# is available and image can be created
docker --version
docker compose version
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
docker images