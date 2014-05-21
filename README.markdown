# /etc/hosts Puppet Module

Manage (dualstack-)hosts in /etc/hosts .

## Requirements
* puppetlabs/stdlib >= 4.0.0

## Usage
Various alt hostnames my be specified. IP Addresses are validated. At least a IPv4 OR IPv6 address must be specified.

class { 'hosts':
    hosts => {
        'sidious.local' => {alt =>['sidious', 'puppet'], ipv4 => '192.168.2.1, ipv6 => 'fdc9:7739:4b55:da6:0:0:0:2'},
        'vader.local' => {alt =>['vader'], ipv4 => '192.168.2.2', ipv6 => 'fdc9:7739:4b55:da6:0:0:0:10']}
    }
}