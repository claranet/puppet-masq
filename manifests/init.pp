# == Class: masq
#
# Sets up iptables masquerading
#
class masq (
) inherits masq::params {

  # validate parameters here

  class { 'masq::config': } ~>
  Class['masq']
}
