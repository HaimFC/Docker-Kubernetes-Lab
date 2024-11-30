
# Cloud Computing Homework 2

## Overview
This repository contains files for kubernetes/docker lab. The assignment focuses on containerization, deployment, and horizontal scaling of applications using Docker and Kubernetes. The solutions are divided into two parts: Docker, Kubernetes.

---

## Part 1: Docker
### Tasks
1. **Containerize the Iperf Server**:
   - Use `alpine:3.11.5` as the base image.
   - Ensure the container runs the Iperf server upon startup.

2. **Push to Docker Hub**:
   - Upload the Docker image to Docker Hub.

3. **Automate Deployment**:
   - Create a bash script `docker.sh` to automate:
     - Spinning up the container on VM_2.
     - Running an Iperf client on VM_1 to send packets to VM_2 for a configurable `DURATION` and `INTERVAL`.
     - Stopping the container on VM_2 after the task.

### Files
- `docker/Dockerfile`: Dockerfile for the Iperf server.
- `docker/docker.sh`: Bash script to automate the tasks.

### Usage
```bash
# Navigate to the docker directory
cd docker

# Ensure the script has executable permissions
chmod +x docker.sh

# Run the script
./docker.sh
```

---

## Part 2: Kubernetes
### Tasks
1. **Cluster Setup**:
   - Install Kubernetes with one master node and three worker nodes.
   - Use Docker as the container runtime.
   - Configure Weave Net as the network plugin.

2. **Horizontal Pod Autoscaling**:
   - Deploy a PHP-Apache server.
   - Configure autoscaling based on CPU load.

3. **Custom Nginx Image**:
   - Create a custom Nginx Docker image with additional metadata:
     - **Version 1**:
       - `Server address: <IP:PORT>`
       - `Student IDs: <Your_Student_IDs>`
       - `Server version: version-1`
     - **Version 2**:
       - Similar to version 1 but with `Server version: version-2`.

   - Upload both versions to Docker Hub.

4. **Resource Management**:
   - Create Kubernetes resources in `hw2_resources_ver1.yaml`:
     - Deployment with 1 replica.
     - Service exposing the deployment on port `30555`.
     - HorizontalPodAutoscaler with min replicas = 1, max replicas = 100.
   - Automate resource creation, updating, rolling back, and cleanup using `kubernetes.sh`.

### Files
- `kubernetes/Dockerfile_ver1`: Dockerfile for version 1 of the custom Nginx image.
- `kubernetes/Dockerfile_ver2`: Dockerfile for version 2 of the custom Nginx image.
- `kubernetes/hw2_resources_ver1.yaml`: Kubernetes configuration for version 1.
- `kubernetes/hw2_resources_ver2.yaml`: Kubernetes configuration for version 2.
- `kubernetes/kubernetes.sh`: Bash script for managing Kubernetes resources.

### Usage
```bash
# Navigate to the kubernetes directory
cd kubernetes

# Ensure the script has executable permissions
chmod +x kubernetes.sh

# Run the script
./kubernetes.sh
```

---

## Repository Structure
```plaintext
.
├── docker/
│   ├── Dockerfile
│   ├── docker.sh
├── kubernetes/
│   ├── Dockerfile_ver1
│   ├── Dockerfile_ver2
│   ├── hw2_resources_ver1.yaml
│   ├── hw2_resources_ver2.yaml
│   ├── kubernetes.sh
└── README.md
```

---

## Submission Instructions
1. **Docker**:
   - Place `Dockerfile` and `docker.sh` in the `docker/` directory.
   - Push the code to your GitHub repository.

2. **Kubernetes**:
   - Place `Dockerfile_ver1`, `Dockerfile_ver2`, `hw2_resources_ver1.yaml`, `hw2_resources_ver2.yaml`, and `kubernetes.sh` in the `kubernetes/` directory.
   - Push the code to your GitHub repository.

3. Ensure all scripts have executable permissions.

---

## Useful Resources
- [Docker Documentation](https://docs.docker.com/engine/reference/commandline/docker/)
- [Docker Hub](https://hub.docker.com/)
- [Kubernetes Setup Guide](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)
- [Kubernetes Horizontal Pod Autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)

---

## Author
This repository is developed as part of the Cloud Computing course.

