# Class: hosts
#
# Due restrictions of puppet as structural language it not possible to do this as type.
# The hash is currently not validated, so take care ;-)
#
# Example:
#  class{ 'hosts':
#    hosts => {
#      'sidious.srv1.tschnet.de' => {alt =>['sidious'], ipv4 => '144.76.42.151', ipv6 => '2a01:4f8:191:439a:0:0:0:2'},
#      'vader.srv1.tschnet.de' => {alt =>['vader'], ipv4 => '144.76.133.212', ipv6 => '2a01:4f8:191:439a:0:0:0:10']}
#    }
#  }

class hosts (
  $hosts = undef
) {
  package { 'resolvconf':
    ensure => absent
  } ->
  concat { '/etc/hosts':
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  concat::fragment { 'hosts_base':
    target  => '/etc/hosts',
    content => template('hosts/etc/hosts.erb'),
    order   => '01',
  }
}