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
      ensure     => file,
      mode       => '0644',
      owner      => root,
      group      => root,
      source     => 'puppet:///modules/ssh/etc/ssh/ssh_config';
  }

  # SSHD configuration
  file {
    $ssh::params::config_ssh_authorized_keys:
      ensure     => directory,
      mode       => '0755',
      owner      => root,
      group      => root,
      purge      => true,
      recurse    => true,
      force      => true;
  }

  file {
    $ssh::params::config_sshd_conf:
      ensure     => file,
      mode       => '0644',
      owner      => root,
      group      => root,
      source     => 'puppet:///modules/ssh/etc/ssh/sshd_config',
      notify     => Service[$ssh::params::service_sshd];
  }

  # Populate authorized_keys
  $file_defaults = {
    'ensure'     => file,
    'mode'       => '0644',
    'owner'      => root,
    'group'      => root,
  }

  create_resources(file, $ssh::authorized_keys, $file_defaults)

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
