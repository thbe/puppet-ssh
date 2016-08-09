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

  # ssh service configuration
  service {
    $ssh::params::service_sshd:
      ensure  => 'running',
      enable  => true,
      require => [
        Package[$ssh::params::package_openssh_server],
        File[$ssh::params::config_sshd_conf]
      ];
  }
}
