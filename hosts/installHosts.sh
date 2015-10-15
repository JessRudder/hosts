#!/bin/sh

# Backup existing hosts
if [ -f "/etc/hosts" ]; then

  echo "Creating a backup of your existing hosts file."

  # if hosts.bak does not exist, save current hosts as hosts.bak
  if [[ ! -e "/etc/hosts.bak" ]]; then
    mv /etc/hosts /etc/hosts.bak
  fi
fi

# Download hosts file and save it to local machine
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" -o "/etc/hosts" >/dev/null 2>&1