require 'rake'

class String
    def in(dir)
        File.join(dir, self)
    end

    def to_absolute
        File.expand_path(self)
    end

    def winpath
        self.gsub(File::SEPARATOR, File::ALT_SEPARATOR || File::SEPARATOR)
    end
end

WINDOWS_FILE_MAP = {
  '.vim' => 'vimfiles',
  '.gvimrc' => '_gvimrc',
  '.vimrc' => '_vimrc',
  '.vimcommon' => '_vimcommon',
  '.vsvimrc' => '_vsvimrc',
  '.ReSharper' => 'Documents/ReSharper',
}

MAC_FILE_MAP = {
  '.ReSharper' => :skip
}

desc "Link the dotfiles into position"
task :install do
    puts "Installing ..."
    linkables = Dir.glob('*/**{.symlink}')

    skip_all = false
    overwrite_all = false
    backup_all = false

    linkables.each do |linkable|
        overwrite = false
        backup = false

        target = map_to_target(linkable)
        next if target == :skip
        linkable = linkable.winpath if (windows?)
        target = target.winpath if (windows?)
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
            overwrite_file(target) if overwrite || overwrite_all
            `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
        end
        symlink_file(linkable, target)
    end

    Rake::Task['update'].invoke
    puts "Installed."
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

def map_to_target(linkable)
    file = linkable.split('/').last.split('.symlink').last
    file = "." << file
    target = file
    target = WINDOWS_FILE_MAP[file] if windows? && WINDOWS_FILE_MAP[file]
    target = MAC_FILE_MAP[file] if mac? && MAC_FILE_MAP[file]
    target == :skip ? :skip : "#{ENV['HOME']}/#{target}"
end


def overwrite_file(file)
  if windows? && File.directory?(file)
    system %Q{rmdir /s /q "#{file}"}
  else
    rm_rf(file)
  end
end

def symlink_file(linkable, target)
    puts "Symlinking: " << linkable << " is linked as " << target
    if (windows?)
        symlink_file_on_windows(linkable, target)
    else
        `ln -s "$PWD/#{linkable}" "#{target}"`
    end
end

def symlink_file_on_windows(linkable, target)
    linkable_absolute = linkable.to_absolute.winpath
    target_absoulte = target.to_absolute.winpath
    command = [] << "cmd" << "/c" << "mklink" 
    command << "/d" if File.directory?(linkable_absolute)
    command << target_absoulte << linkable_absolute
    sh(*command)
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

# vim: nowrap sw=2 sts=2 ts=8 ft=ruby:
