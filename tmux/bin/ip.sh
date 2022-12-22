#!/bin/bash
ip addr | grep 'state UP' -A2 | head -n3 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'
