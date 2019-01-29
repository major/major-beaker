#!/bin/bash -x

# Source the common test script helpers
. /usr/bin/rhts_environment.sh

# Ensure ansible is installed
/opt/ansible-venv/bin/ansible --version

# Run Ansible
export ANSIBLE_LOG_PATH=$OUTPUTFILE
/opt/ansible-venv/bin/ansible-playbook -i hosts.txt playbook.yml

if [ $? -eq 0 ]; then
    report_result finished PASS 0
else
    report_result finished FAIL 1
fi

exit 0
