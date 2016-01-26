# Puppet module without shell script

/etc/puppet/manifests/site.pp

```
node 'test1' {
include mount 
}
```

init.pp manifest:

```
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

}
```

/etc/puppet/hiera.yaml---
```
:backends:
- yaml
:hierarchy:
- mountpoint_cfg
:yaml:
:datadir: /etc
```

/etc/mountpoint_cfg.yamlmountpoints:
```
- point: /mnt/tmp
device: /dev/mapper/vg1-test1
fs: ext3
options: rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered
- point: /mnt/tmp2
device: /dev/mapper/vg1-test2
fs: ext3
options: rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered
```

Automatic puppet template application on file change can be set additionally with inotifywait, calling puppet agent -t
