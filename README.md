# ECS-Agent-Status
A docker container that can run on AWS ECS container instances and report ECS agent status to CloudWatch

**Description:** ECS agent on EC2 launch type can get disconnected and there is no out of the box monitoring for it. This can be frustrating, especially if you're using a custom AMI. ECS-Agent-Status runs on your container instance and reports 0 if the agent is connected and reports 1 if it's disconnected. You can then create an alarm to get notified if the agent is disconnected.  

**Installation and Usage:**

You should run it ideally in the user data of the image with this command::

                                        docker run -d aliabas/ecsstatus:latest

*Options:*
Use a "--restart always" policy if you're really paranoid about the agent
Run with --init if you'd like the container to exit gracefully, as the parent process doesn't reap the child process (currently a WIP)

**Creating an Alarm:** Consider creating a conservative alarm as chances of false positive are high because as per AWS public documentation: "The Amazon ECS container agent disconnects and reconnects several times per hour as a part of its normal operation, so agent connection events should be expected. These events are not an indication that there is an issue with the container agent or your container instance." 

**License**
GPLv3+

**Disclaimer**
There is no guarantee that:

- the software will meet your requirements
- the software will be uninterrupted, timely, secure or error-free
- the results that may be obtained from the use of the software will be effective, accurate or reliable
- the quality of the software will meet your expectations
- any errors in the software will be corrected.