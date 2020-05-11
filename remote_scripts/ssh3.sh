source ./config.sh
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h3 "/home/ubuntu/s3.sh > /home/ubuntu/execution.log" 
