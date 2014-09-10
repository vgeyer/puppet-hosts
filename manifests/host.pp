# Definition: host

define hosts::host (
  $ipv4 = undef,
  $ipv6 = undef,
  $host = undef
) {
  if($ipv4 == undef and $ipv6 == undef) {
    fail("Neither an ipv4 or ipv6 was given for ${name}")
  }
  if($host == undef) {
    fail("No host was specified for ${name}")
  }

  if($ipv4) {
    validate_ipv4_address($ipv4)
    concat::fragment { "hosts_${name}_ipv4":
      target  => '/etc/hosts',
      content => "${ipv4} ${host}",
      order   => '10',
    }
  }

  if($ipv6) {
    validate_ipv6_address($ipv6)
    concat::fragment { "hosts_${name}_ipv6":
      target  => '/etc/hosts',
      content => "${ipv6} ${host}",
      order   => '20',
    }
  }
}