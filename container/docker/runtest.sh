#!/bin/bash -x

# Source the common test script helpers
. /usr/bin/rhts_environment.sh

# Install pre-requisites for Ansible
yum -y install python
wget -O /opt/get-pip.py https://bootstrap.pypa.io/get-pip.py
python /opt/get-pip.py
pip install virtualenv
virtualenv /opt/ansible-venv

# Install the latest stable ansible version
/opt/ansible-venv/bin/pip install ansible

# Ensure ansible is installed
/opt/ansible-venv/bin/ansible --version

if [ $? -eq 0 ]; then
    report_result finished PASS 0
else
    report_result finished FAIL 1
fi

exit 0
