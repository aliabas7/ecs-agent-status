# ecs-cloudwatch
A simple docker image that can run on Amazon EC2 instance and report ECS agent status to CloudWatch

This is a side project and while I will try to maintain it, please test it and use at your own risk. 

Usage:
You should run it ideally in the user data of the image with this command:

docker run -d -t aliabas/ecsstatus:latest

It reports 0 if the agent is connected and reports 1 if it's disconnected. You can then create a conservative alarm to get notfied if the agent is disconnected. 

Note: It's recommended to create a conservative alarm as chances of false positive are high because "The Amazon ECS container agent disconnects and reconnects several times per hour as a part of its normal operation, so agent connection events should be expected. These events are not an indication that there is an issue with the container agent or your container instance." 

Since this is an open source project, feel free to make any changes, however, there is no guarantee that:

- the software will meet your requirements
- the software will be uninterrupted, timely, secure or error-free
- the results that may be obtained from the use of the software will be effective, accurate or reliable
- the quality of the software will meet your expectations
- any errors in the software will be corrected.
