# == Class masq::config
#
# This class is called from masq
#
class masq::config {

  sysctl { 'net.ipv4.ip_forward':
    ensure    => $::masq::nat_forward,
    permanent => 'yes',
    value     => '1',
  }

  unless ($::masq::nat_rfc1918) {
    firewall { '900 1918_10':
      chain       => 'POSTROUTING',
      destination => '10.0.0.0/8',
      action      => 'accept',
      proto       => 'all',
      table       => 'nat',
    }
    firewall { '901 1918_172':
      chain       => 'POSTROUTING',
      destination => '172.16.0.0/12',
      action      => 'accept',
      proto       => 'all',
      table       => 'nat',
    }
    firewall { '903 1918_192':
      chain       => 'POSTROUTING',
      destination => '192.168.0.0/16',
      action      => 'accept',
      proto       => 'all',
      table       => 'nat',
    }

  }

  firewall { '950 masq':
    chain => 'POSTROUTING',
    jump  => 'MASQUERADE',
    proto => 'all',
    table => 'nat',
  }
}
