#  DevOps Project Challenge



## Installation and configuration DockerHost 

`passwd root`
`systemctl restart sshd`
`systemctl enable sshd`
`yum install docker -y`
`systemctl start docker`
`systemctl enable docker`
`docker container ls`
`docker image ls`


## Installation and configuration jenkins

`yum install java* -y`
`yum install jenkins -y`
`systemctl start jenkins`
`systemctl enable jenkins`
`yum install git`
`ssh-keygen`
`ssh-copy-id root@(ansible private ip)`


## Installation and configuration Ansible

`yum install ansible -y`
`passwd root`
`systemctl restart sshd`
`systemctl enable sshd`
`vim /etc/ansible/hosts`
[dockerhost]
private ip set
`ssh-keygen`
`ssh-copy-id -i root@(dockerhost private ip)`
`yum install docker -y`
`systemctl start docker`
`systemctl enable docker`


## jenkins CI/CD pipeline setup

* Send files or execute command over ssh:

`rsync -avh /var/lib/jenkins/workspace/docker-job/Dockerfile  root@ansible private ip:/opt`

* Send files or execute command over ssh:

`cd /opt
docker image build -t $JOB_NAME:v1.$BUILD_ID .
docker image tag $JOB_NAME:v1.$BUILD_ID fazzlerabby/$JOB_NAME:v1.$BUILD_ID
docker image tag $JOB_NAME:v1.$BUILD_ID fazzlerabby/$JOB_NAME:latest
docker image push fazzlerabby/$JOB_NAME:v1.$BUILD_ID
docker image push fazzlerabby/$JOB_NAME:latest
docker image rmi  $JOB_NAME:v1.$BUILD_ID  fazzlerabby/$JOB_NAME:v1.$BUILD_ID  fazzlerabby/$JOB_NAME:latest`

* Send build artifacts over ssh:

`ansible-playbook  /sourcecode/ansible-playbook.yml`


## Docker container deploy in DockerHost

- hosts: all
  tasks:
    - name: create conbtainer
      shell: docker container run -itd --name docker-container -p 9000:80 fazzlerabby/docker-job
