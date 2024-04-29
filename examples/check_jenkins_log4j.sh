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
echo "Checking Java processes for log4j usage..."
for pid in $(pgrep -f 'jenkins.war'); do
    echo "Checking Java process ID: $pid for log4j usage..."
    jcmd $pid VM.system_properties | grep 'log4j' && echo "Log4j properties found in process $pid." || echo "No log4j properties in process $pid."
done

echo "Check complete."