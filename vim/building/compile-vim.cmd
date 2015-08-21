call configure-vs.cmd
call settings-vim.cmd

pushd vim\src

:: make clean (manually)

del /Q ObjCULYHTRAMD64\*.*
del /Q ObjCULYHTRi386\*.*
del /Q ObjGXOULYHTRAMD64\*.*
del /Q ObjGXOULYHTRi386\*.*
del /Q ObjGXULYHTRAMD64\*.*
del /Q ObjGXULYHTRi386\*.*


:: Compile gVim

:: yes for gVim, no for vim
set GUI=yes
set DIRECTX=yes
:: OLE interface, usually with GUI=yes
set OLE=yes
set IME=yes
set GIME=yes
call %VS_DIR%\VC\bin\nmake /C /S /f  Make_mvc.mak clean
call %VS_DIR%\VC\bin\nmake /C /S /f  Make_mvc.mak 


:: Compile vim

:: yes for gVim, no for vim
set GUI=no
set DIRECTX=no
:: OLE interface, usually with GUI=yes
set OLE=no
set IME=no
set GIME=no
call %VS_DIR%\VC\bin\nmake /C /S /f  Make_mvc.mak clean
call %VS_DIR%\VC\bin\nmake /C /S /f  Make_mvc.mak 
popd

call packing-vim.cmd

