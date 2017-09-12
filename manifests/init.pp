# == Class: masq
#
# Sets up iptables masquerading
#
# === Parameters:
#
# nat_rfc1918 - if false, will not NAT traffic for RFC1918 space
class masq (
  $nat_forward = present,
  $nat_rfc1918 = true,
) {

  if $::kernel != 'Linux' {
    fail("Sorry, ${::kernel} is unsupported")
  }

  include ::masq::config

}
