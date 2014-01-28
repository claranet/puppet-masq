# == Class masq::service
#
# This class is meant to be called from masq
# It ensure the service is running
#
class masq::service {
  include masq::params

  service { $masq::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
