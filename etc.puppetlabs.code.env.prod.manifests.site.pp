# File location /etc/puppetlabs/code/environments/production/manifests/site.pp
## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a primary and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

#notify { 'before-message': }
#  notify { 'after-message': }

#  class {'ntp':
#    require => Notify['before-message'],
#    require => Notify['after-message'],
# include ntp

node default {
  include ntp
#  include puppet_apache
}

#node puppetagent1.mylabserver.com {
#  include apache
#}

node puppetagent1.mylabserver.com {
  include puppet_apache
  
  puppet_apache::vhosts { 'apache_vhosts':
    port      => 80,
    subdomain => 'vhosts',
    admin     => 'admin@test.com',
    docroot   => '/var/www/html/vhosts',
  } 
}

node puppetagent2.mylabserver.com {
  include puppet_apache

  puppet_apache::vhosts { 'apache_vhosts':
    port      => 80,
    subdomain => 'vhosts',
    admin     => 'admin@test.com',
    docroot   => '/var/www/html/vhosts',
  }

  puppet_apache::vhosts { 'apache_vhosts_dev':
    port      => 8080,
    subdomain => 'vhosts_dev',
    admin     => '',
    docroot   => '/var/www/html/vhosts-dev',
  }
}

