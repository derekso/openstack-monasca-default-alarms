#! /bin/bash -x

source .monascarc

# VM Monitoring
# =============
monasca alarm-definition-create --description "Alarms when the CPU usage of the specified instance is high" --severity LOW --match-by resource_id "Instance CPU Usage" "avg(cpu.utilization_perc) > 90 times 3"

# System Monitoring
# =================
monasca alarm-definition-create --description "Alarms when the specified host is down or not reachable" --severity HIGH "Host Status" "host_alive_status > 0"

monasca alarm-definition-create --description "Alarms when the specified HTTP endpoint is down or not reachable" --severity HIGH --match-by "service,component,hostname,url" "HTTP Status" "http_status > 0"

monasca alarm-definition-create --description "Alarms when CPU usage is high" --severity HIGH "CPU Usage" "avg(cpu.idle_perc) < 10 times 3"

monasca alarm-definition-create --description "Alarms when disk inode usage is high" --severity HIGH --match-by "hostname,device" "Disk Inode Usage" "disk.inode_used_perc > 90"

monasca alarm-definition-create --description "Alarms when disk usage is high" --severity HIGH --match-by "hostname,device" "Disk Usage" "disk.space_used_perc > 90"

monasca alarm-definition-create --description "Alarms when memory usage is high" --severity MEDIUM "Memory Usage" "avg(mem.usable_perc) < 10 times 3"

monasca alarm-definition-create --description "Kernel crash dumps are avaiable on disk" --severity MEDIUM "Kernel Crash Dumps" "crash.dump_count > 1"

monasca alarm-definition-create --description "Alarms when either incoming or outgoing network errors are high" --severity MEDIUM "Network Errors" "net.in_errors_sec > 5 or net.out_errors_sec > 5"

monasca alarm-definition-create --description "Alarms when the specified process is not running" --severity HIGH --match-by "process_name,hostname" "Process Check" "process.pid_count < 1"

# Monasca Monitoring
# =======-==========
monasca alarm-definition-create --description "Alarms when the specified consumer_group is not keeping up with the incoming messages" --severity MEDIUM --match-by "consumer_group,hostname" "Kafka Consumer Lag" "avg(kafka.consumer_lag) > 1000 times 3"

monasca alarm-definition-create --description "Alarms when the elapsed time that the Monasca Agent takes to send metrics to the Monasca API is high" --severity MEDIUM "Monasca Agent Emit Time" "avg(monasca.emit_time_sec) > 2 times 3"

monasca alarm-definition-create --description "Alarms when the elapsed time that the Monasca Agent takes to collect metrics is high" --severity MEDIUM "Monasca Agent Collection Time" "avg(monasca.collection_time_sec) > 5 times 3"

monasca alarm-definition-create --description "Alarms when ZooKeeper latency is high" --severity MEDIUM "ZooKeeper Latency" "avg(zookeeper.avg_latency_sec) > 1 times 3"

# Misc
# ====

monasca alarm-definition-create --description "Alarms when the depth of the message queue is high" --severity MEDIUM --match-by "queue,hostname" "RabbitMQ Queue Depth" "avg(rabbitmq.queue.messages) > 10 times 3"

monasca alarm-definition-create --description "Alarms when the slow query rate is high" --severity MEDIUM "MySQL Slow Query Rate" "avg(mysql.performance.slow_queries) > 10 times 3"

monasca alarm-definition-create --description "Alarms on failure to reach the Apache status endpoint" --severity HIGH "Apache Status" "apache.status > 0"

monasca alarm-definition-create --description "Alarms when there are no idle workers in the Apache server" --severity MEDIUM "Apache Idle Worker Count" "avg(apache.performance.idle_worker_count) < 1 times 3"

monasca alarm-definition-create --description "Alarms when the NTP time offset is high" --severity MEDIUM "NTP Time Sync" "ntp.offset > 5 or ntp.offset < -5"
