FROM signiant/docker-jenkins-amazon-linux-base:amazon2
MAINTAINER devops@signiant.com

# python module installs:
# Install the AWS CLI - used by promo process
# Install shyaml - used by promo process to ECS
# Install boto and requests - used by the S3 MIME type setter
# Install MaestroOps, slackclient, and datadog
RUN pip install awscli shyaml boto requests maestroops datadog slackclient

# This entry will either run this container as a jenkins slave or just start SSHD
# If we're using the slave-on-demand, we start with SSH (the default)

# Default Jenkins Slave Name
ENV SLAVE_ID JAVA_NODE
ENV SLAVE_OS Linux

ADD start.sh /
RUN chmod 777 /start.sh

CMD ["/start.sh"]
