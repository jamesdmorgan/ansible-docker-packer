# Latest version of centos
FROM centos:centos7
MAINTAINER James Morgan <james.morgan@opebet.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN pip install ansible
ENV PATH /usr/local/packer:$PATH
ADD site.yml /srv/ansible/site.yml
ADD inventory /etc/ansible/hosts
RUN ansible-playbook /srv/ansible/site.yml -c local
