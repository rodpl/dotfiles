@echo on

:: TINY, SMALL, NORMAL, BIG or HUGE. NORMAL or above recommended
set FEATURES=HUGE

:: IDE integrations we don't need
set NETBEANS=yes
set CSCOPE=yes

:: UTF-8 encoding
set MBYTE=yes
set ARABIC=no
set FARSI=no

:: Enable Python scripting (variables taken from setttings-python.cmd)
call settings-python.cmd
set DYNAMIC_PYTHON=yes
set PYTHON=%PYTHON_PATH%
set PYTHON_VER=%PYTHON_VERSION%

:: Enable Ruby sripting (variables taken from setttings-ruby.cmd)
call settings-ruby.cmd
set DYNAMIC_RUBY=yes
set RUBY=%RUBY_PATH%
set RUBY_VER=%RUBY_VERSION%
:: This is determined by folder name of C:\tools\ruby22\include\ruby-x.x.x
set RUBY_VER_LONG=2.3.0
:: This is determined by folder name of C:\tools\ruby22\include\ruby-x.x.x\x64-mswin64_120
set RUBY_PLATFORM=x64-mswin64_120
:: This is determined by file name of C:\tools\ruby22\lib\x64-msvcr120-ruby220.dll
set RUBY_INSTALL_NAME=x64-msvcr120-ruby230

:: Optimization - SPACE, SPEED, MAXSPEED
set OPTIMIZE=SPEED

