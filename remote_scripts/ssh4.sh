source ./config.sh
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h4 "/home/ubuntu/s4.sh > /home/ubuntu/execution.log" 
