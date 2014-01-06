# == Class: ssh
#
# This module manages SSH.
#
# === Parameters
#
# Document parameters here.
#
# === Variables
#
# === Examples
#
#  include ssh
#
# === Authors
#
# Author Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2013 Thomas Bendler
#
class ssh {

  # Include Puppetlabs standard library
  include stdlib
  include ssh::params

  # Start workflow
  if $ssh::params::linux {
    anchor { 'ssh::start': }
    -> class { 'ssh::package': }
    ~> class { 'ssh::config': }
    ~> class { 'ssh::service': }
    ~> anchor { 'ssh::end': }
  }
}
