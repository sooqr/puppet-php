# == Class: php::extension::zookeeper
#
# Install the PHP zookeeper extension
#
# === Parameters
#
# [*ensure*]
#   The version of the package to install
#   Could be "latest", "installed" or a pinned version
#   This matches "ensure" from Package
#
# [*package*]
#   The package name in your provider
#
# [*provider*]
#   The provider used to install the package
#
# [*inifile*]
#   The path to the extension ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# === Variables
#
# No variables
#
# === Examples
#
#  include 'php::extension::zookeeper'
#
#  class {'php::extension::zookeeper':
#   ensure => latest
#  }
#
# === Authors
#
# Eric Bus <eric.bus@sooqr.com>
#
# === Copyright
#
# Copyright 2016 Sooqr B.V., unless otherwise noted.
#
class php::extension::zookeeper(
  $ensure     = $php::extension::zookeeper::params::ensure,
  $package    = $php::extension::zookeeper::params::package,
  $provider   = $php::extension::zookeeper::params::provider,
  $inifile    = $php::extension::zookeeper::params::inifile,
  $settings   = $php::extension::zookeeper::params::settings,
  $builddeps  = $php::extension::zookeeper::params::builddeps,
) inherits php::extension::zookeeper::params {

  include php::dev

  $builddeps.each |$dep| {
    package { $dep:
      ensure => 'present',
    }
  }

  php::extension { 'zookeeper':
    ensure   => $ensure,
    package  => $package,
    provider => $provider,
  }

  php::config { 'extension-zookeeper':
    file    => $inifile,
    config  => $settings
  }
}
