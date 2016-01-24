class mount::filesystems {
  file {
    'mount_point':
      ensure => 'file',
      source => 'puppet:///modules/mount/mount_point.sh',
      path => '/usr/local/bin/mount_point.sh',
      owner => 'root'
      group => 'root'
      mode  => '0744', 
      notify => Exec['run_mount_point'],
  }
  exec {
    'run_mount_point':
     command => '/usr/local/bin/mount_point.sh',
     refreshonly => true,
  }
}
