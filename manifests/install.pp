# Class: ssh::install
#
# This module install the packages for the ssh module
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class ssh::install {
  package { $ssh::params::package_openssh_clients: ensure => installed; }
  package { $ssh::params::package_openssh_server:  ensure => installed; }
}
