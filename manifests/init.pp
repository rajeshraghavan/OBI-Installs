# == Class: obiee_cm_poc
#
# Puppet class that maintains the configuration settings for the Cognos instanceconfig.xml and NQSConfig.INI files
# instanceconfig.xml
# NQSConfig.INI
#
# === Authors
#
# Author: Raj Raghavan <rajeshr@qualcomm.com>
# Date:   August 3, 2015
#
# === Copyright
#
# Copyright 2015 rajeshr, unless otherwise noted.
#
#class obiee_cm_poc ($targetinst = "pbipoc", $ver_no = "11_1_1_7",  $userid = "obiee user", $group_name="obiee user group")
class obiee_cm_poc ($bu_name = "pbi", $env_name = "poc", $ver_no = "11_1_1_7",  $userid = "obiee user", $group_name="obiee user group")
{
if $::osfamily == 'RedHat' 
{
          include obiee_cm_poc::config
}
}
