#Starting the services..

echo "Starting Node Exporter..."
node_exporter &

sleep 2

echo "Starting Prometheus..."
cd /home/manish/prometheus-2.52.0.linux-amd64
./prometheus --config.file=/home/manish/scale-to-cloud-project/monitoring/prometheus.yml &

sleep 2

echo "Starting Alertmanager..."
cd /home/manish/alertmanager-0.27.0.linux-amd64
./alertmanager --config.file=/home/manish/scale-to-cloud-project/monitoring/alertmanager.yml &

sleep 2

echo "Starting Webhook..."
python3 /home/manish/scale-to-cloud-project/scripts/webhook_client.py &

echo "All services started!"
