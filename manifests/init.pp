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
class ssh (
  $authorized_keys = {
    'vagrant' => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key',
  }
) inherits ssh::params {
  # Start workflow
  if $ssh::params::linux {
    # Containment
    contain ssh::package
    contain ssh::config
    contain ssh::service

    Class['ssh::package'] ->
    Class['ssh::config'] ->
    Class['ssh::service']
  }
}
