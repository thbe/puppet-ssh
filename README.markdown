#ssh

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ssh](#setup)
    * [What ssh affects](#what-ssh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ssh](#beginning-with-ssh)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


##Overview

The ssh module provides the installation procedure for SSH including the setup of ssh keys
within knownhosts as well as authorized keys outside user home owned by root.

##Module Description

The SSH module provide a secure mechanism for using terminals on remote servers
accros the internet. All communication is encrypted and secured.


##Setup

###What ssh affects

* ssh package.
* ssh configuration file.
* ssh alternative service configuration.

###Beginning with ssh

include '::ssh' is enough to get you up and running if the parameters point to
proper values.  If you wish to pass in parameters like which servers to use then you
can use:

```puppet
include ssh
```

##Usage

All interaction with the ssh module can do be done through the main ssh class.
This means you can simply toggle the options in the ssh class to get at the full
functionality.

###I just want SSH, what's the minimum I need?

```puppet
include '::ssh'
```


##Reference

###Classes

* ssh: Main class, includes all the rest.
* ssh::package: Handles the packages.
* ssh::config: Handles the configuration file.
* ssh::service: Handles the alternative service link.

###Parameters

There are no parameters available in the ssh module currently

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* RedHat Enterprise Linux 5/6
* Scientific Linux 5/6

Testing on other platforms has been light and cannot be guaranteed. 


##Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.
