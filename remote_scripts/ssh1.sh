source ./config.sh
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h1 "/home/ubuntu/s1.sh > /home/ubuntu/execution.log"
