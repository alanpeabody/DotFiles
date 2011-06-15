require 'rake'

# Insprired by Zach Holman's dot file install script.
# (But not nearly as organized nor well done. (step two?))

desc "Install my Dot files."

task :install => [:symlink, :run_scripts]

task :run_scripts do
end

task :symlink do

  skip_all = false
  overwrite_all = false
  backup_all = false

  ['.vimrc','.zshrc','.ackrc','.vim','.oh-my-zsh','.gitconfig','.tmux.conf'].each do |file|
    overwrite = false
    backup = false

    target = "#{ENV["HOME"]}/#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{file}" "#{target}"`
  end
end

task :default => 'install'
