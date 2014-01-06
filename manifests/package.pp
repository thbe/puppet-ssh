# Class: ssh::package
#
# This module contain the service configuration for SSH
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class ssh::package {
  package { $ssh::params::packageClient: ensure => installed; }

  package { $ssh::params::packageServer: ensure => installed; }
}
