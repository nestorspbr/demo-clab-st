# demo-clab-st
Demo LAB GNMI using Containerlab and SR Linux, CLOS topology 4 leaves 2 spines. 
Other components: gnmic, Prometheus and Grafana.
LAB tested with 4vCPU and 16 GB vRAM.

Requirements:

## Install Docker
```
sudo yum install docker -y

sudo usermod -a -G docker ec2-user 

sudo systemctl enable docker.service 

sudo systemctl start docker.service

sudo systemctl status docker.service
```

## Install Containerlab

```
sudo bash -c "$(curl -sL https://get.containerlab.dev)"
```

## Install gnmic client

```bash -c "$(curl -sL https://get-gnmic.openconfig.net)"```

## Start the LAB

```sudo clab deploy -t demo.yml```
