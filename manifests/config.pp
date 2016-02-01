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
#
class obiee_cm_poc::config inherits obiee_cm_poc
{
 $bu_name = $obiee_cm_poc::bu_name
 $env_name = $obiee_cm_poc::env_name
 $ver_no = $obiee_cm_poc::ver_no
 $user_id = $obiee_cm_poc::user_id
 $group_name = $obiee_cm_poc::group_name
 $targetinst="${bu_name}${env_name}"
# $targetinst = $obiee_cm_poc::targetinst
# $bu_name=regsubst($targetinst, '^(...)(.*?)$', '\1')
# $env_name=regsubst($targetinst, '^(.*?)(...)$', '\2')
 $mw_home = "/local/mnt/obiee/${bu_name}/${env_name}/${ver_no}"
 $tarhost=hiera("$targetinst")
 $hostnm=$tarhost[0]['host_nm']
 notify { 'host_name':
       message => "Hostname is ${hostnm}. BU Name is $targetinst, version is ${ver_no}."
   }
   
  if $::hostname == "${hostnm}"
   { 

	file { 'instanceconfig':
   		path => "${mw_home}/instances/instance1/config/OracleBIPresentationServicesComponent/coreapplication_obips1/instanceconfig.xml",
		owner =>"$userid",
		group => "$group_name",
		mode => '0740',
   		ensure => file,
   		source => "puppet:///modules/obiee_cm_poc/instanceconfig_${targetinst}.xml",
	}
 }
}

