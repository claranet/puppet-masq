# == Class masq::params
#
# This class is meant to be called from masq
# It sets variables according to platform
#
class masq::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'masq'
      $service_name = 'masq'
    }
    'RedHat', 'Amazon': {
      $package_name = 'masq'
      $service_name = 'masq'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
