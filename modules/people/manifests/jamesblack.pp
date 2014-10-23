class people::jamesblack {
  include projects::anvil

  $home = "/Users/${::boxen_user}"
  $my   = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { 
    $my: 
      ensure => directory
  }


}