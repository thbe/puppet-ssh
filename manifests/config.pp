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
# Sample Usage: Should not be used standalone
#
class ssh::config {

  # SSH configuration
  file {
    $ssh::params::config_ssh_conf:
      ensure => file,
      mode   => '0644',
      owner  => root,
      group  => root,
      source => 'puppet:///modules/ssh/etc/ssh/ssh_config';
  }

  # SSHD configuration
  file {
    $ssh::params::config_ssh_authorized_keys:
      ensure  => directory,
      mode    => '0755',
      owner   => root,
      group   => root,
      purge   => true,
      recurse => true,
      force   => true;
  }

  file {
    $ssh::params::config_sshd_conf:
      ensure => file,
      mode   => '0644',
      owner  => root,
      group  => root,
      source => 'puppet:///modules/ssh/etc/ssh/sshd_config',
      notify => Service[$ssh::params::service_sshd];
  }

  # Populate authorized_keys
  $file_defaults = {
    'ensure' => file,
    'mode'   => '0644',
    'owner'  => root,
    'group'  => root,
  }

  create_resources(file, $ssh::authorized_keys, $file_defaults)

  # Hostkey distribution
  if $::sshdsakey {
    @@sshkey { "${::fqdn}_dsa":
      ensure       => present,
      host_aliases => [ $::fqdn, $::hostname, $::ipaddress ],
      type         => dsa,
      key          => $::sshdsakey,
    }
  } else {
    @@sshkey { "${::fqdn}_dsa":
      ensure => absent,
    }
  }
  if $::sshrsakey {
    @@sshkey { "${::fqdn}_rsa":
      ensure       => present,
      host_aliases => [ $::fqdn, $::hostname, $::ipaddress ],
      type         => rsa,
      key          => $::sshrsakey,
    }
  } else {
    @@sshkey { "${::fqdn}_rsa":
      ensure => absent,
    }
  }
  if $::sshecdsakey {
    @@sshkey { "${::fqdn}_ecdsa":
      ensure       => present,
      host_aliases => [ $::fqdn, $::hostname, $::ipaddress ],
      type         => 'ecdsa-sha2-nistp256',
      key          => $::sshecdsakey,
    }
  } else {
    @@sshkey { "${::fqdn}_ecdsa":
      ensure => absent,
      type   => 'ecdsa-sha2-nistp256',
    }
  }
  if $::sshed25519key {
    @@sshkey { "${::fqdn}_ed25519":
      ensure       => present,
      host_aliases => [ $::fqdn, $::hostname, $::ipaddress ],
      type         => 'ed25519',
      key          => $::sshed25519key,
    }
  } else {
    @@sshkey { "${::fqdn}_ed25519":
      ensure => absent,
      type   => 'ed25519',
    }
  }

  resources { 'sshkey':
    purge => true,
  }

  Sshkey <<| |>>
}
