# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::service
class puppet_apache::service {
#  service { 'apache_service':
  service { "${puppet_apache::service_name}":
#    alias  => 'apache_service',
    ensure     => $puppet_apache::service_ensure,
    enable     => $puppet_apache::service_enable,
#    name       => $puppet_apache::service_name,
    hasrestart => true,
#    before     => File["apache_config"], # you can give Class reference "Class $" here as well, but if you already define alias use that one
  }
}
