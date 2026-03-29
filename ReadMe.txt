Project Title: Local VM Monitoring and Auto-Scaling to GCP


------------------------------------------------------------
1. Project Overview
------------------------------------------------------------
This project demonstrates a cloud bursting solution where a local virtual machine (VM) is monitored for CPU usage. When CPU usage exceeds a defined threshold, a new VM is automatically created in Google Cloud Platform (GCP). When the load decreases, the cloud VM is deleted to optimize resource usage and cost.

------------------------------------------------------------
2. Technologies Used
------------------------------------------------------------
- VirtualBox (Local VM)
- Ubuntu 22.04
- Prometheus (Monitoring)
- Grafana (Visualization)
- Node Exporter (Metrics collection)
- Alertmanager (Alert handling)
- Flask (Webhook service)
- Google Cloud Platform (Compute Engine)
- gcloud CLI

------------------------------------------------------------
3. Project Structure
------------------------------------------------------------
scale-to-cloud-project/
│
├── monitoring/
│   ├── prometheus.yml
│   ├── alert_rules.yml
│   └── alertmanager.yml
│
├── scripts/
│   ├── burst.sh
│   └── webhook_receiver.py
│
├── app/
│   ├── app.py
│   └── install_app.sh
│
├── start_all.sh
└── README.txt

------------------------------------------------------------
4. Setup Instructions
------------------------------------------------------------

Step 1: Create Local VM
- Install VirtualBox
- Create Ubuntu VM
- Ensure internet connectivity

Step 2: Install Monitoring Tools
- Install Node Exporter and run on port 9100
- Install Prometheus and configure prometheus.yml
- Start Prometheus server
- Install Grafana and connect to Prometheus

Step 3: Configure Alerting
- Define alert rules for CPU usage (HighCPU and LowCPU)
- Configure Alertmanager
- Start Alertmanager service

Step 4: Setup Webhook
- Create Flask-based webhook service
- Configure Alertmanager to send alerts to webhook

Step 5: Configure GCP
- Create GCP project
- Enable Compute Engine API
- Install gcloud CLI
- Authenticate using: gcloud auth login

Step 6: VM Auto-Scaling Script
- Create burst.sh to create VM in GCP
- Add tag: http-server
- Attach startup script (install_app.sh)

Step 7: Firewall Configuration (One-time setup)
- Allow HTTP traffic on port 80
- Command:
  gcloud compute firewall-rules create allow-http \
    --allow tcp:80 \
    --target-tags=http-server

------------------------------------------------------------
5. How It Works
------------------------------------------------------------
1. User generates load on local application
2. CPU usage increases
3. Prometheus detects high CPU usage
4. Alertmanager sends alert to webhook
5. Webhook executes burst.sh
6. GCP VM is created automatically
7. Nginx is installed and serves web page

When CPU usage decreases:
1. Low CPU alert is triggered
2. Webhook deletes the GCP VM
3. Resources are freed to reduce cost

------------------------------------------------------------
6. Sample Application
------------------------------------------------------------

Local VM:
- Flask-based application used to generate CPU load

Load Testing:
- ApacheBench or curl

Example:
ab -n 200 -c 20 http://localhost:8000/load
or 
stress --cpu 4 --timeout 180

GCP VM:
- Nginx installed via startup script
- Displays message:
  "Burst Mode Active: Served from GCP VM"

------------------------------------------------------------
7. Output Verification
------------------------------------------------------------
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000
- Alertmanager: http://localhost:9093
- Webhook: http://localhost:5001
- GCP VM list:
  gcloud compute instances list
- Browser:
  http://<external-ip>

------------------------------------------------------------
8. Start Script (start_all.sh)
------------------------------------------------------------
A shell script is provided to start all services with a single command.

Command:
./start_all.sh

This script starts:
- Node Exporter
- Prometheus
- Alertmanager
- Webhook Server

Logs are saved in:
- node_exporter.log
- prometheus.log
- alertmanager.log
- webhook.log

This simplifies setup and ensures all components are started correctly.

------------------------------------------------------------
9. Features
------------------------------------------------------------
- Real-time monitoring of CPU usage
- Automatic scale-out (VM creation)
- Automatic scale-in (VM deletion)
- Cloud-based deployment
- Cost optimization


