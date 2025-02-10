#!/bin/bash
echo "OS Version:"
cat /etc/os-release

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)"

echo "Memory Usage:"
free -h
