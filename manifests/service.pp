# Class: ssh::service
#
# This module contain the service configuration for SSH
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: Should not be used standalone
#
class ssh::service {
  service { $ssh::params::serviceSshd:
    ensure  => running,
    enable  => true,
    name    => $ssh::params::serviceSshd,
    require => [
      Package[$ssh::params::packageServer],
      File[$ssh::params::configSshdConf]];
  }
}
