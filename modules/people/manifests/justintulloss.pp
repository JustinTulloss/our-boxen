class people::justintulloss {
  include macvim
  include onepassword
  include chrome::beta
  include adium
  include julia
  include nodejs::v0_10

  package {
    [
      'reattach-to-user-namespace',
      'tmux',
      'zsh'
    ]:
  }

  class { 'nodejs::global':
      version => 'v0.10'
  }

  nodejs::module { 'mocha':
    node_version => 'v0.10'
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
