# == Class masq::install
#
class masq::install {
  include masq::params

  package { $masq::params::package_name:
    ensure => present,
  }
}
