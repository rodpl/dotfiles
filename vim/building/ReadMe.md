Building VIM x64 on Windows
===========================

Install Python 2.7
------------------

1.  Install Python
2.  Edit settings in  `settings-python.cmd` if neccesary. 

DONT USE 2.7.11 WONT COMPILE

Building Ruby x64 on Windows
----------------------------

For integration with vim we need ruby but not compiled with mingw but Visual Studio.
There are few tools needed to compile: bison, sed, ruby 1.8 or later. Bison and sed
can be found with git for windows. If we have path set to git, there is no need
to install these tools. There is no bison and sed since 2.8 git. Install from here
[Bison for Windows](http://gnuwin32.sourceforge.net/packages/bison.htm)
[Sed for Windows](http://gnuwin32.sourceforge.net/packages/sed.htm)

Ruby compilation needs ruby :( 2.x

1.  Edit settings in  `settings-ruby.cmd` if neccesary.
2.  Run `compile-ruby.cmd`.
3.  Add path to ruby install folder.

References:

1.  [Get and Build Ruby 1.9 for Windows](http://cowboyprogramming.com/2007/10/07/get-and-build-ruby-19-for-windows/)
2.  [Fix compilation failure with Ruby 2.0.0](https://groups.google.com/forum/#!msg/vim_dev/P8l30hk9hyE/cG8wYjh3paMJ)

Building VIM
------------

1.  Install [Windows SDK 7.1](http://www.microsoft.com/en-us/download/confirmation.aspx?id=8279)
    If installation failed check [this](http://www.mathworks.com/matlabcentral/answers/95039-why-does-the-sdk-7-1-installation-fail-with-an-installation-failed-message-on-my-windows-system)
2.  Install patch for [SDK 7.1](http://www.microsoft.com/en-us/download/confirmation.aspx?id=4422)
3.  Edit settings

References:

1.  [Building Vim and gVim on Windows](https://mgiuffrida.github.io/2015/06/27/building-vim-on-windows.html)
2.  [Vim 64-bit Build](http://solar-blogg.blogspot.ca/p/vim-build.html)
3.  [Sample compilation script](https://tuxproject.de/projects/vim/_compile.bat.php)

Building YouCompleteMe plugin
=============================

To fully use of YouCompleteMe we need to have clang.


Buildling llvm
--------------

According to [Build LLVM/Clang (3.3) on Windows x64](http://solar-blogg.blogspot.com/2013/04/build-llvmclang-33-on-windows-x64.html)

1.  Run `compile-llvm.cmd`

Building YCM
-------------

1.  Run `compile-ycm.cmd`
                                                                                
If there are problem with not finding library when running vim, check this one.
[http://stackoverflow.com/questions/14552348/runtime-error-r6034-in-embedded-python-application](http://stackoverflow.com/questions/14552348/runtime-error-r6034-in-embedded-python-application)
In my situation wrong library was in `C:\Program Files\Mercurial`

References:

1.  [Windows Installation Guide](https://github.com/Valloric/YouCompleteMe/wiki/Windows-Installation-Guide)
2.  [Build Ycmd (you complete me backend) @Windows](http://ah7675-blog.logdown.com/posts/261883-build-ycmd-you-complete-me-backend-windows)


Vimproc
=======

The fastest way is to download from [Releases](https://github.com/Shougo/vimproc.vim/releases) and put into lib.

FAQ
===

Q: How to handle "Runtime Error!" with R6034 message when trying to run vim in command line?

A: Usual problem is becouse MS dlls in PATH are not compatible. Find which of them are loaded
by using Sysinternals procexp and remove then or change the PATH env variable.
[Runtime error R6034 in embedded Python application](http://stackoverflow.com/questions/14552348/runtime-error-r6034-in-embedded-python-application)