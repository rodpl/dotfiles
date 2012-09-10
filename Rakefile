require 'rake'
desc "Link the dotfiles into position"
task :install do
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV['HOME']}/.#{file}"
    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all, [A]bort"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    symlink_file(linkable, target)
  end

  Rake::Task['update'].invoke
end

task :uninstall do
  Dir.glob('**/*.symlink').each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV['HOME']}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end
  end
end

task :update do
  `git submodule init`
  `git submodule update`
end

task :default => 'install'

def symlink_file(linkable, target)
    if (windows?)
        symlink_file_on_windows(linkable, target)
    else
        `ln -s "$PWD/#{linkable}" "#{target}"`
    end
end

def symlink_file_on_windows(linkable, target)
    command = [] << "cmd" << "/c" << "mklink" 
    command << "/d" if File.directory?(linkable)
    command << target << linkable
end

# Platform checks

def windows?
  (/mswin|msys|mingw32/ =~ RbConfig::CONFIG['host_os']) != nil
end

def mac?
  (/darwin|mac os/ =~ RbConfig::CONFIG['host_os']) != nil
end

def linux?
  (/linux/ =~ RbConfig::CONFIG['host_os']) != nil
end

def cygwin?
  RUBY_PLATFORM.downcase.include?("cygwin")
end

def unix?
  linux? or mac?
end

def classpath_separator?
  if cygwin? then
    ";"
  else
    File::PATH_SEPARATOR
  end
end

def all?
  true
end
