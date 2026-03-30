#!/bin/bash

vpd -i RW_VPD -d re_enrollment_key
sudo crossystem disable_dev_request=1;sudo reboot
