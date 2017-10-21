# openstack-monasca-default-alarms
Default Monasca Alarm Definitions for OpenStack

This is a collection of useful default alarm definitions for OpenStack Monasca, which is an open-source multi-tenant, highly scalable, performant, fault-tolerant monitoring-as-a-service solution that integrates with OpenStack.

## How to run this script?

1. Check out this repository in your OpenStack control node or a linux box attached to the Openstack admin network.
2. Modify the `.monascarc` file for the password the OpenStack URL.
3. If you are not running this script in openstack control node, you need to install monasca client. For example, if you are using SUSE Linux, run 

`zypper in python-monascaclient`

4. Make the script executable: `chmod +x alarm-def-create.sh`
5. Execute the script `./alarm-def-create.sh`

## Reference

The origin work can be reference at here.

https://github.com/hpcloud-mon/ansible-monasca-default-alarms

