# point

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started with point](#setup)
    * [What point affects](#what-point-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with point](#beginning-with-point)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to create and manage multiple mount points that do not exist in /etc/fstab.

## Module Description

Each mount point have its own configuration in /etc/mountpoint_cfgs; the configuration files define the following options: file system, type, options, dump, pass.

The module should be able to manage multiple mount points. The goal is to ensure that they are mounted with the configured options. A configuration file update trigger a “refresh” of the target mount point.

In addition to the configuration file, mount points have a specific folder structure, that is also managed through puppet. All mount points should have the following folders: partition, data, data/private and exports.

The partition folder have an id file that contains the mount point it’s currently mounted on.

## Setup

### What point affects

* /etc/mountpoint_cfgs

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

### Beginning with point

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

```
puppet apply
```

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

Works in every Linux OS.

## Development

Clone the project at github and create issues to improve the puppet mount point module.
