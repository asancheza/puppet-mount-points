# == Class: point
#
# Mount points.
#
# === Authors
#
# Alejandro Sanchez Acosta <asanchez@neurowork.net>
#
# === Copyright
#
# Copyright 2016 Alejandro Sanchez Acosta unless otherwise noted.
#

class mount {
  file {'/etc/mountpoint_cfgs/':
    ensure => file,
    mode => 0755,
    recurse => true,
    source => 'puppet:///modules/mount/mountpoint_cfgs/',
    notify  => Exec['mount-script']
  }

  file {'/root/mount-script.sh':
    path => '/root/mount-script.sh',
    ensure => file,
    mode => 0755,
    source => 'puppet:///modules/mount/mount-script.sh',
  }

  exec {'mount-script':
    command => "/root/mount-script.sh",
  }
}
