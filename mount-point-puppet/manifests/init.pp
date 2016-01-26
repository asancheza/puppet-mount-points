class mount {

  $mountpoints = hiera('mountpoints')

  $mountpoints.each |$mp| {
    mount { $mp[point]:
    device => $mp[device],
    fstype => $mp[fs],
    ensure => "mounted",
    options => $mp[options],
    atboot => "true",
  }

  $point = $mp[point];
  file { "$point/partition":
    ensure => 'directory',
    require => Mount["$point"],
  }

  file { "$point/data":
    ensure => 'directory',
    require => Mount["$point"],
  }
  
  file { "$point/data/private":
    ensure => 'directory',
    require => File["$point/data"],
  }

  file { "$point/exports":
    ensure => 'directory',
    require => Mount["$point"],
  }

  file { "$point/partition/id":
    ensure => 'file',
    content => "$point",
    require => File["$point/partition"],
    subscribe => File['/etc/mountpoint_cfg.yaml'],
  }
}
