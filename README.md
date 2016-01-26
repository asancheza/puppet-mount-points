# Steps to use mount-point

- Install Docker Toolbox
- Install puppet-client from Docker Hub
- Install puppetmaster from Docker Hub
- Configure puppet agent and puppetmaster
- Clone the mount module in puppetmaster /etc/puppet/modules/
- Add in puppetmaster /etc/puppet/manifests/site.pp
```
node default {
  include mount
}
```

# Run
```
puppet agent -t
```
# Modules

1. puppet-mount: Puppet module using shell scripting 
2. puppet-mount-puppet: Puppet module using Hierra for the configuration file.

Enjoy ;)
