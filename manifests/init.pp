# == Class: ssh
#
# This is the ssh module. This module install all things
# required to setup local ssh server.
#
# === Parameters
#
# Here is the list of parameters used by this module.
#
# [*authorized_keys*]
#   Hash that specify the usernames and authorized_keys for
#   that host
#   Default value is:
#   'vagrant' => 'ssh-rsa AAA[...]9WhQ== vagrant insecure public key'
#
# === Variables
#
# No additonal variables are required for this module
#
# === Examples
#
#  class { '::ssh':
#    authorized_keys => {
#      '/etc/ssh.d/vagrant' => {
#        content => 'ssh-rsa AAAAB3Nza[...]qm8tehUc9c9WhQ== vagrant insecure public key',
#      },
#    },
#  }
#
# === Authors
#
# Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2016 Thomas Bendler, unless otherwise noted.
#
class ssh (
  $authorized_keys = {
    '/etc/ssh.d/vagrant' => {
      content => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key',
    },
  }
) inherits ssh::params {

  # Start workflow
  if $ssh::params::linux {
    class{'ssh::install': } ->
    class{'ssh::config': } ~>
    class{'ssh::service': } ->
    Class['ssh']
  }
  else {
    warning('The current operating system is not supported!')
  }
}
