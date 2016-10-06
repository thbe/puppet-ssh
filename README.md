#ssh

[![Build Status](https://travis-ci.org/thbe/puppet-ssh.png?branch=master)](https://travis-ci.org/thbe/puppet-ssh)
[![Puppet Forge](https://img.shields.io/puppetforge/v/thbe/ssh.svg)](https://forge.puppetlabs.com/thbe/ssh)
[![Coverage Status](https://coveralls.io/repos/thbe/puppet-ssh/badge.svg?branch=master&service=github)](https://coveralls.io/github/thbe/puppet-ssh?branch=master)

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
with distributed known hosts as well as authorized keys outside user home owned by root.

##Module Description

The SSH module provide a secure mechanism for using terminals on remote servers
accross the internet. All communication is encrypted and secured.


##Setup

###What ssh affects

* ssh package
* ssh configuration file
* ssh alternative service configuration

###Beginning with ssh

include '::ssh' is enough to get you up and running if the parameters point to
proper values.  If you wish to pass in parameters like which servers to use then you
can use:

```puppet
include ::ssh
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

* ssh: Main class, include all sub-classes
* ssh::install: Install the required packages
* ssh::config: Handles the configuration files
* ssh::service: Handles the services

###Parameters

####`authorized_keys`

Hash that specify username and authorized keys for that user.


##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* RedHat Enterprise Linux 6/7
* CentOS 6/7
* Oracle Enterprise Linux 6/7

Testing on other platforms has been light and cannot be guaranteed.


##Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.
