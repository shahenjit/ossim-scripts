#!/bin/bash

# Fix annoying issue with 0.0.0.0 in OSSIM
cp /etc/ossim/agent/plugins/ossec-single-line.cfg /etc/ossim/agent/plugins/ossec-single-line.cfg.local
sed -i -e '/src_ip=.*\}/ s/\S\w*/resolv(&)/4' -e '/dst_ip=.*\}/ s/\S\w*/resolv(&)/4' /etc/ossim/agent/plugins/ossec-single-line.cfg.local
ossim-reconfig && /etc/init.d/ossim-agent restart
