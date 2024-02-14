#!/bin/bash

set -e

gnmic_cmd="gnmic --skip-verify -u admin -p NokiaSrl1!"

printf "gnmic version : $(gnmic version | grep version | awk '{print $NF}')\n"
printf "clab version  : $(sudo containerlab version | grep version | awk '{print $NF}')\n"

# get SR Linux Nodes
nodes=$(sudo docker ps -f label=containerlab=demo -f label=clab-node-kind=nokia_srlinux --format {{.Names}} | paste -s -d, -)

# configure interfaces via gNMI
${gnmic_cmd} \
      --log \
      -a ${nodes} \
      -e json_ietf \
      set \
      --request-file interfaces_template.gotmpl \
      --request-file subinterfaces_template.gotmpl \
      --request-vars interfaces_template_vars.yaml
# configure interfaces via gNMI
${gnmic_cmd} \
      --log \
      -a ${nodes} \
      -e json_ietf \
      set \
      --request-file routing_policy_prefix_set_template.gotmpl \
      --request-file routing_policy_template.gotmpl \
      --request-vars routing_policy_vars.yaml
# configure interfaces via gNMI
${gnmic_cmd} \
      --log \
      -a ${nodes} \
      -e json_ietf \
      set \
      --request-file network_instance_template.gotmpl \
      --request-file network_instance_bgp_template.gotmpl \
      --request-vars network_instance_template_vars.yaml
