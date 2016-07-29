# == Class: php::contrib::enable_extension
#
# Helper to enable extension for all or specific SAPI's
#
# === Parameters
#
# [*sapi*]
#   SAPI's to enable the extension for. Defaults to ALL
#
# [*extension*]
#   The name of the extension to enable.
#
# [*priority*]
#   The priority of the extension, defaults to 20.
#
# === Variables
#
# No variables
#
# === Examples
#
#
#
# === Authors
#
#
#
# === Copyright
#
#
#
define php::contrib::enable_extension(
  $sapi = 'ALL',
  $extension,
  $priority = 20,
) {
    if $sapi == 'ALL' {
      exec { "php-enable-extension-${package}":
        command => "/usr/sbin/php5enmod ${package}",
        creates => "/etc/php5/conf.d/${priority}-${package}.ini",
      }
    } elsif $pecl_enable {
      $pecl_enable.each |$sapi| {
        exec { "php-enable-extension-${package}-${sapi}":
          command => "/usr/sbin/php5enmod -s ${sapi} ${package}",
          creates => "/etc/php5/${sapi}/conf.d/${priority}-${package}.ini",
        }
      }
    }
}
