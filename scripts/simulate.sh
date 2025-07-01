#!/bin/bash

# Simulate failure on the server by stopping critical services

echo "Simulating failure on this server..."

# Stop web server (if it exists)
if systemctl is-active --quiet nginx; then
    echo "Stopping nginx web server..."
    sudo systemctl stop nginx
fi

# Stop database server (if it exists)
if systemctl is-active --quiet mysql; then
    echo "Stopping MySQL database server..."
    sudo systemctl stop mysql
fi

if systemctl is-active --quiet mariadb; then
    echo "Stopping MariaDB database server..."
    sudo systemctl stop mariadb
fi

# Unmount file server directory (if it exists)
if mountpoint -q /srv/files; then
    echo "Unmounting /srv/files..."
    sudo umount /srv/files
fi

echo "Failure simulation complete."
echo "Please run the Ansible restore playbook to recover the services."
