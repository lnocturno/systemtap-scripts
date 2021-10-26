# Getting Started

## Supported OS
OL8.4 UEK 5.4.17-2102.203.6

## Prerequisites
systemtap kernel-debuginfo kernel-debuginfo-common should be installed.

# SCSI faults emulation
Example of usage:

cd scsi_faults_emulation

./run.sh scsi_io_err_fault.stp/scsi_timeout_fault.stp 8 240

where 8 is a major number of block device and 240 is a minor number
