# == Class: php::extension::xsl
#
# Install the xsl PHP extension
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
#  include php::extension::xsl
#
# === Authors
#
# Christian Winther <cw@nodes.dk>
#
# === Copyright
#
# Copyright 2012-2015 Nodes, unless otherwise noted.
#
class php::extension::xsl(
  $ensure   = $php::extension::xsl::params::ensure,
  $package  = $php::extension::xsl::params::package,
  $provider = $php::extension::xsl::params::provider,
  $inifile  = $php::extension::xsl::params::inifile,
  $settings = $php::extension::xsl::params::settings
) inherits php::extension::xsl::params {

  php::extension { 'xsl':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-xsl':
    file   => $inifile,
    config => $settings
  }

}
