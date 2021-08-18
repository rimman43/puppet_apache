# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class puppet_apache (
  String $install_name,
  String $install_ensure,
  String $config_path,
  String $config_ensure,
  String $service_name,
  String $service_ensure,
  String $service_enable,

  
) {
   contain puppet_apache::install
   contain puppet_apache::config
   contain puppet_apache::service

  Class['::puppet_apache::install']
  -> Class['::puppet_apache::config']
  -> Class['::puppet_apache::service']
}
