# Class: ssh::params
#
# This module contain the parameters for SSH module
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: Should not be used standalone
#
class ssh::params {

  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux = true

      # Package definition
      $package_openssh_clients     = 'openssh-clients'
      $package_openssh_server      = 'openssh-server'

      # Config definition
      $config_ssh_conf             = '/etc/ssh/ssh_config'
      $config_sshd_conf            = '/etc/ssh/sshd_config'
      $config_ssh_known_hosts      = '/etc/ssh/ssh_known_hosts'
      $config_ssh_authorized_keys  = '/etc/ssh.d'

      # Service definition
      $service_sshd                = 'sshd'
    }
    default  : {
      $linux                       = false
    }
  }

  # SSH definitions
}
