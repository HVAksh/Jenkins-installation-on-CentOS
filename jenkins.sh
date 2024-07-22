#!/bin/bash

echo ""
echo  "\033[4mThis is specific to VMware Workstaion/Virtual Box.\033[0m"
echo ""


echo ""
echo  "\033[4mDISABLE FIREWALL and SELINUX.\033[0m"
echo ""


systemctl stop firewalld.service
systemctl disable firewalld.service
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config



echo ""
echo  "\033[4mJenkins Installtion Begins.\033[0m"
echo ""


sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload

echo ""
echo  "\033[4mEnable Jenkins.\033[0m"
echo ""

sudo systemctl enable jenkins

echo ""
echo  "\033[4mStart Jenkins.\033[0m"
echo ""

sudo systemctl start jenkins

echo ""
echo  "\033[4mShow status of Jenkins.\033[0m"
echo ""

sudo systemctl status jenkins

