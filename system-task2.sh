#Problem 1
# System Health Monitoring Script:
# Develop a script that monitors the health of a Linux system. It should check
# CPU usage, memory usage, disk space, and running processes. If any of
# these metrics exceed predefined thresholds (e.g., CPU usage > 80%), the
# script should send an alert to the console or a log file.



#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

check_cpu() {
  local cpu_usage=$(top -b -n 1 | awk '/^%Cpu/ {print $2}')
  if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    echo "High CPU Usage: $cpu_usage%" >&2
  fi
}

check_memory() {
  local memory_usage=$(free | awk '/Mem:/ {print $3/$2 * 100}')
  if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "High Memory Usage: $memory_usage%" >&2
  fi
}

check_disk() {
  local disk_usage=$(df -h / | awk '/\// {print $(NF-1)}' | sed 's/%//')
  if (( $disk_usage > $DISK_THRESHOLD )); then
    echo "High Disk Usage: $disk_usage%" >&2
  fi
}


check_processes() {
  local total_processes=$(ps aux --no-heading | wc -l)
  if (( $total_processes > 500 )); then
    echo "High Number of Processes: $total_processes" >&2
  fi
}

main() {
  check_cpu
  check_memory
  check_disk
  check_processes
}

main
