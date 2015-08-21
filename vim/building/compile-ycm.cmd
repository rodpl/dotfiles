@echo on
call ./configure-vs.cmd

rd /s /q ycm
mkdir ycm

pushd ycm
echo Compiling YCM ...
cmake -G "Visual Studio 12 Win64" -DPATH_TO_LLVM_ROOT=C:\tools\clang . %USERPROFILE%\.vim\plugged\YouCompleteme\third_party\ycmd\cpp
msbuild /p:Configuration=Release /t:BoostParts YouCompleteMe.sln
msbuild /p:Configuration=Release /t:ycm_core YouCompleteMe.sln
msbuild /p:Configuration=Release /t:ycm_client_support YouCompleteMe.sln

popd

