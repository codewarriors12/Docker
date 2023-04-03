#user data should be added as below while bootstrapping
#!/bin/bash
sudo apt-get update -y   
sudo curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl enable docker.service
sudo systemctl enable containerd.service