# @summary 
#  Apache classed mapping
class puppet_apache (
 String $install_name,
 String $install_ensure,
 String $config_path,
 String $config_ensure,
 String $service_name,
 Enum["running", "stopped"] $service_ensure,
 Boolean $service_enable,
 String $docroot,
) {
 contain puppet_apache::install
 contain puppet_apache::config
 contain puppet_apache::service

 Class['::puppet_apache::install']
 -> Class['::puppet_apache::config'] 
 ~> Class['::puppet_apache::service'] 
}
