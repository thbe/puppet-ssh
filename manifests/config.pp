# Class: ssh::config
#
# This module contain the configuration for SSH
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class ssh::config {

  # SSH configuration
  file {
    $ssh::params::configSshConf:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      source  => 'puppet:///modules/ssh/ssh_config';
  }

  # SSHD configuration
  file {
    $ssh::params::configSshAuthorizedKeys:
      ensure  => directory,
      mode    => '0755',
      owner   => root,
      group   => root;

    $ssh::params::configSshdConf:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      source  => "puppet:///modules/ssh/sshd_config",
      notify  => Service[$ssh::params::serviceSshd];
  }

  # Hostkey distribution
  @@sshkey { "${::fqdn}_dsa":
    host_aliases => [ $::fqdn, $::hostname, $::ipaddress ],
    type         => dsa,
    key          => $::sshdsakey,
  }
  @@sshkey { "${::fqdn}_rsa":
    host_aliases => [ $::fqdn, $::hostname, $::ipaddress ],
    type         => rsa,
    key          => $::sshrsakey,
  }
  Sshkey <<| |>> { ensure => present }
}
