#!/bin/bash

fdisk /dev/block/$1 << EOF

n
p
$2

+$3M

w
EOF
echo fdisk
#fileend
