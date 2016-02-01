class obiee_cm_poc::params
{
  $target_inst = "${bu_name}${env_name}"
  
  case $target_inst {
    'pbipoc': { $hostnm = 'obi117poc3' }
    'default': { fail("Host name of the target environment ${target_inst} cannot be found")}
  }
}


