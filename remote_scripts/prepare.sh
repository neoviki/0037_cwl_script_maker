source ./config.sh

ssh -t -i /home/ubuntu/cwl.pem ubuntu@$h1 "sudo rm /home/ubuntu/execution.log"
ssh -t -i /home/ubuntu/cwl.pem ubuntu@$h2 "sudo rm /home/ubuntu/execution.log"
ssh -t -i /home/ubuntu/cwl.pem ubuntu@$h3 "sudo rm /home/ubuntu/execution.log"
ssh -t -i /home/ubuntu/cwl.pem ubuntu@$h4 "sudo rm /home/ubuntu/execution.log"


ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h1 "touch /home/ubuntu/execution.log"
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h2 "touch /home/ubuntu/execution.log"
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h3 "touch /home/ubuntu/execution.log"
ssh -i /home/ubuntu/cwl.pem -t ubuntu@$h4 "touch /home/ubuntu/execution.log"

