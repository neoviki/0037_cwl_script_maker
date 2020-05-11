source ./config.sh
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h2 "/home/ubuntu/s2.sh > /home/ubuntu/execution.log" 
