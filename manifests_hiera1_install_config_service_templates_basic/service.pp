# @summary 
#  For Apache service 
class puppet_apache::service {
  service { 'apache_service':
# service { "${puppet_apache::service_name}":
    ensure       => $puppet_apache::service_ensure,
    enable       => $puppet_apache::service_enable,
    name         => $puppet_apache::service_name,
    hasrestart   => true,
 }
}
