# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class puppet_apache (
  String $install_name,
  String $install_ensure,
) {
  include puppet_apache::install
}
