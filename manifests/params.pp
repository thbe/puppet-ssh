# Class: ssh::params
#
# This module contain the parameters for SSH
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class ssh::params {

  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux = true

      # Package definition
      $packageClient           = 'openssh-clients'
      $packageServer           = 'openssh-server'

      # Config definition
      $configSshConf           = '/etc/ssh/ssh_config'
      $configSshdConf          = '/etc/ssh/sshd_config'
      $configSshKnownHosts     = '/etc/ssh/ssh_known_hosts'
      $configSshAuthorizedKeys = '/etc/ssh.d'

      # Service definition
      $serviceSshd             = 'sshd'
    }
    default  : {
      $linux = false
    }
  }

  # SSH definitions

}
