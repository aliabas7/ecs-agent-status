FROM ubuntu

#Install dependencies and prerequisites
RUN apt-get update &&
    apt-get install --no-install-recommends --no-install-suggests -y \
        ca-certificates \
        curl \
        less \
        unzip &&
    apt-get -y clean all

#install aws cli and clean up
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/awscliv2.zip" &&
    unzip "/awscliv2.zip" &&
    "/aws/install" &&
    rm -rf /var/lib/apt/lists/* &&
    rm -rf /aws &&
    rm -rf awscliv2.zip

COPY ./ecs_script.sh /ecs_script.sh

CMD ["/ecs_script.sh"]
