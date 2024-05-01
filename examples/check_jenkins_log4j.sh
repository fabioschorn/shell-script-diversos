#!/bin/bash

# Script to check for log4j usage in Jenkins instance on Linux
# Jenkins version: 2.122

echo "Checking for log4j presence in Jenkins (Version 2.122)..."

# Define Jenkins home directory (modify accordingly)
JENKINS_HOME="/var/lib/jenkins"

# Check for running log4j processes
echo "Checking for active log4j processes..."
pgrep -fa 'log4j' | grep 'java' && echo "Log4j process found running!" || echo "No active log4j processes."

# Check for log4j libraries in Jenkins plugins
echo "Searching for log4j libraries within Jenkins plugins..."
find "$JENKINS_HOME/plugins" -type f -name "*.jar" -exec sh -c 'jar -tvf {} | grep -q log4j && echo "log4j found in: {}"' \;

# Check for log4j configuration files
echo "Looking for log4j configuration files in Jenkins home..."
find "$JENKINS_HOME" -type f -name "log4j*.properties" -or -name "log4j*.xml" && echo "Found log4j configuration files." || echo "No log4j configuration files found."

# Check for Java processes using log4j
echo "Checking for Java processes using log4j..."
for pid in $(pgrep -f 'java'); do
    ls -l /proc/$pid/fd | grep -i 'log4j' && echo "Java process $pid is using log4j."
done

echo "Log4j check complete."