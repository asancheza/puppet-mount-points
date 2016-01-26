# Steps to use mount-point

- Install Docker Toolbox
- Install puppet-client from Docker Hub
- Install puppetmaster from Docker Hub
- Configure puppet agent and puppetmaster
- Copy the mount module in puppetmaster
- Add in puppetmaster /etc/puppet/manifests/site.pp
```
node default {
  include mount
}
```
- Run
```
puppet agent -t
```
- Enjoy ;)

- Added puppet-module using Hiera without shell script.
