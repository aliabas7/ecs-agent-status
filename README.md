# ECS-Agent-Status
A simple docker image that can run on Amazon EC2 instance and report ECS agent status to CloudWatch

**Description:** ECS agent on EC2 launch type can get disconnected and there is no out of the box monitoring. This can be frustrating, especially if you're using a custom AMI. This simple docker image that runs on your container instance and reports 0 if the agent is connected and reports 1 if it's disconnected. You can then create a conservative alarm to get notified if the agent is disconnected.  

**Installation and Usage:**

You should run it ideally in the user data of the image with this command (with a --restart always policy if you're really paranoid about your agent):

                      docker run -d -t aliabas/ecsstatus:latest

**Creating an Alarm:** It's recommended to create a conservative alarm as chances of false positive are high because "The Amazon ECS container agent disconnects and reconnects several times per hour as a part of its normal operation, so agent connection events should be expected. These events are not an indication that there is an issue with the container agent or your container instance." 

**License**
GPLv3+

**Disclaimer**
There is no guarantee that:

- the software will meet your requirements
- the software will be uninterrupted, timely, secure or error-free
- the results that may be obtained from the use of the software will be effective, accurate or reliable
- the quality of the software will meet your expectations
- any errors in the software will be corrected.
