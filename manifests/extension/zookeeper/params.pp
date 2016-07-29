# == Class: php::extension::zookeeper::params
#
# Defaults file for the zookeeper PHP extension
#
# === Parameters
#
# No parameters
#
# === Variables
#
# [*ensure*]
#   The version of the package to install
#   Could be "latest", "installed" or a pinned version
#   This matches "ensure" from Package
#
# [*package*]
#   The package name in your provider
#
# [*builddeps*]
#   The package names of the Zookeeper library in your OS repository
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
# === Examples
#
# No examples
#
# === Authors
#
# Eric Bus <eric.bus@sooqr.com>
#
# === Copyright
#
# Copyright 2016 Sooqr B.V., unless otherwise noted.
#
class php::extension::zookeeper::params {

  $ensure     = '0.2.2'
  $package    = 'zookeeper'
  $builddeps  = ['libzookeeper-mt2', 'libzookeeper-mt-dev']
  $provider   = 'pecl'
  $inifile    = "${php::params::config_root_ini}/zookeeper.ini"
  $settings   = [
    'set ".anon/extension" "zookeeper.so"'
  ]

}
