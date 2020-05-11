source ./config.sh

sudo rm -rf /home/ubuntu/input_data
sudo rm -rf /home/ubuntu/cache
sudo rm -rf /tmp/*
dir="/home/ubuntu/scripts/"
scp -i /home/ubuntu/cwl.pem $dir/*.sh ubuntu@$h1:/home/ubuntu/
scp -i /home/ubuntu/cwl.pem $dir/*.sh ubuntu@$h2:/home/ubuntu/
scp -i /home/ubuntu/cwl.pem $dir/*.sh ubuntu@$h3:/home/ubuntu/
scp -i /home/ubuntu/cwl.pem $dir/*.sh ubuntu@$h4:/home/ubuntu/

