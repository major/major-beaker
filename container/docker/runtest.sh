#!/bin/bash -x

# Source the common test script helpers
. /usr/bin/rhts_environment.sh

# Try to install ansible
if [ "${FAMILY}" == "RedHatEnterpriseLinux8" ]; then
    yum -y install http://mirrors.kernel.org/fedora/updates/29/Everything/x86_64/Packages/a/ansible-2.7.5-1.fc29.noarch.rpm
elif [ "${FAMILY}" == "RedHatEnterpriseLinux7" ]; then
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum -y install ansible
elif [ "${FAMILY}" == "Fedora29" ]; then
    dnf -y install ansible
fi

# Try to install python
# if [ -x "/usr/bin/dnf" ]; then
#     dnf -y install python36
# else
#     yum -y install python
#     if [ $? -ne 0 ]; then
#         yum -y install python36
#     fi
# fi

# Install pre-requisites for Ansible
# wget -O /opt/get-pip.py https://bootstrap.pypa.io/get-pip.py
# python /opt/get-pip.py
# pip install virtualenv
# virtualenv /opt/ansible-venv

# Install the latest stable ansible version
# /opt/ansible-venv/bin/pip install ansible

# Ensure ansible is installed
ansible --version

# Run Ansible
ansible-playbook -i hosts.txt playbook.yml

if [ $? -eq 0 ]; then
    report_result finished PASS 0
else
    report_result finished FAIL 1
fi

exit 0
