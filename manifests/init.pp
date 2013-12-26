# == Class: rustlang
#
# Module to install an up-to-date version of Rust from the
# Hansjorg PPA. The use of the PPA means this only works
# on Ubuntu.
#
# === Parameters
# [*package_name*]
#   Which package you want. Valid values are rust-0.x
#   and rust-nightly. Defaults to rust-0.8.
#
# [*ensure*]
#   Whether to install or remove the package. Can be either
#   absent or present. Defaults to present.
#
class rustlang(
  $package_name = 'rust-0.8',
  $ensure = 'present',
) {
  include apt
  validate_re($package_name, '^rust-')
  validate_re($ensure, '^(present|absent)$')
  validate_re($::osfamily, '^Debian$', 'This module uses PPA repos and only works with Debian based distros')

  apt::ppa { 'ppa:hansjorg/rust': }

  package { 'rustlang':
    ensure  => $ensure,
    name    => $package_name,
    require => Apt::Ppa['ppa:hansjorg/rust'],
  }
}
