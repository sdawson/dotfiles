require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**{.symlink}')

  create_links linkables

  install_vim_plug
end

desc "install vim symlinks only"
task :vim_install do
  linkables = Dir.glob('vim/**{.symlink}')

  create_links linkables
end

desc "create all symlinks only"
task :create_symlinks do
  linkables = Dir.glob('*/**{.symlink}')
  config_linkables = Dir.glob('config/**{.symlink}')

  non_config_linkables = linkables - config_linkables
  create_links non_config_linkables
  create_config_links config_linkables
end

def create_links linkables
  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    create_link(linkable, file, target, skip_all: skip_all, overwrite_all: overwrite_all, backup_all: backup_all)
  end
end

def create_config_links linkables
  config_dir = "#{ENV["HOME"]}/.config"
  `mkdir -p config_dir`

  skip_all = false
  overwrite_all = false
  backup_all = false

  # Rather than linking the files inside of the various config subdirectories,
  # this loop links the directories themselves
  linkables.each do |linkable|
    overwrite = false
    backup = false

    dir = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.config/#{dir}"

    create_link(linkable, dir, target, skip_all: skip_all, overwrite_all: overwrite_all, backup_all: backup_all)
  end
end

def create_link(linkable, file, target, skip_all: false, overwrite_all: false, backup_all: false)
  if File.exist?(target) || File.symlink?(target)
    unless skip_all || overwrite_all || backup_all
      puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
      case STDIN.gets.chomp
      when 'o' then overwrite = true
      when 'b' then backup = true
      when 'O' then overwrite_all = true
      when 'B' then backup_all = true
      when 'S' then skip_all = true
      when 's' then return
      end
    end
    FileUtils.rm_rf(target) if overwrite || overwrite_all
    `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
  end
  `ln -s "$PWD/#{linkable}" "#{target}"`
end

desc "uninstall dotfiles"
task :uninstall do
  Dir.glob('**/*.symlink').each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Remove karabiner config manual symlink
    remove_karabiner_config

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end

    remove_vim_plug
  end
end

desc "install vim plug"
task :vim_plug do
  install_vim_plug
end

def install_vim_plug
  puts "Installing vim-plug..."
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  puts "vim-plug installed"
end

def remove_vim_plug
  vim_plug_vimfile = "#{ENV["HOME"]}/.vim/autoload/plug.vim"
  if File.exists?(vim_plug_vimfile)
    FileUtils.rm(vim_plug_vimfile)
  end
end

desc "install karabiner elements"
task :karabiner do
  config_dir = "mac/karabiner_elements/karabiner"
  target = "#{ENV["HOME"]}/.config"

  `mkdir -p #{target}`

  `ln -s "$PWD/#{config_dir}" #{target}`

  user_id = `id -u`
  `launchctl kickstart -k "gui/#{user_id}/org.pqrs.karabiner.karabiner_console_user_server"`
end

desc "uninstall karabiner elements"
task :karabiner_uninstall do
  remove_karabiner_config
end

def remove_karabiner_config
  karabiner_config = "#{ENV["HOME"]}/.config/karabiner"
  if File.symlink?(karabiner_config)
    FileUtils.rm(karabiner_config)
  end
end

desc "install config files that live in ~/.config"
task :config do
  config_linkables = Dir.glob('config/**{.symlink}')
  create_config_links config_linkables
end

task :default => 'install'
