# Class: ssh::service
#
# This module contain the service configuration for SSH
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ssh::service {
  service { $ssh::params::serviceSshd:
    ensure     => running,
    enable     => true,
    name       => $ssh::params::serviceSshd,
    require    => [
      Package[$ssh::params::packageSshd],
      File[$ssh::params::configSshdConf]];
  }
}
