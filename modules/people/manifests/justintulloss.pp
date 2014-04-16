class people::justintulloss {
  include macvim
  include onepassword
  include chrome::beta
  include adium

  package {
    [
      'reattach-to-user-namespace',
      'tmux',
      'zsh'
    ]:
  }

  git::config::global { 'user.email':
    value  => 'justin.tulloss@gmail.com'
  }

  $config_repo = "${boxen::config::srcdir}/config_files"
  repository { $config_repo:
    source => 'JustinTulloss/config_files'
  }

  exec { 'install-config-files':
    command => "cd ${config_repo}; ./install.sh",
    require => Repository[$config_repo]
  }
}
