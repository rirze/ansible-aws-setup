#!/bin/bash

# ansible needs python on nodes to interact with them
apt-get update
apt-get install -y python-minimal
