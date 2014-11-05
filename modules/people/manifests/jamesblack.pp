class people::jamesblack {
  include projects::anvil
  include homebrew
  include iterm2::stable
  include ohmyzsh
  include dropbox
  include sublime_text
  include onepassword
  include chrome
  include onepassword::chrome

  $home = "/Users/${::boxen_user}"
  $my   = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { 
    $my: 
      ensure => directory
  }

  repository { $dotfiles: 
    source => "${::boxen_user}/dotfiles"
  }

  exec { "install dotfiles": 
    cwd => $dotfiles,
    command => "./install.sh",
    provider => shell,
    require => Repository[$dotfiles]
  }

}
