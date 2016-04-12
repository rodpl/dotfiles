@echo on
call settings-ruby.cmd

if not exist ./ruby  (goto cloneruby) else (goto updateruby)

:cloneruby
git clone %RUBY_GIT_REPO%

:updateruby
pushd ruby
git fetch --all
git co -- .
git clean -fd
git co %RUBY_GIT_TAG%
popd

:setenvironment
call configure-vs.cmd

:compileruby
pushd ruby
call win32\configure.bat --prefix=%RUBY_PATH% --target=x64-mswin64 
call nmake clean
call nmake
call nmake test
call nmake install
popd

