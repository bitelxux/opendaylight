#!/bin/sh

echo "launcher" >> /tmp/result
/root/opendaylight/distribution-karaf-0.6.0-Carbon/bin/start
echo "end launcher" >> /tmp/result
/bin/bash


