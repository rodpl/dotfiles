@echo on
call ./configure-vs.cmd

rd /s /q llvm
svn co http://llvm.org/svn/llvm-project/llvm/tags/RELEASE_362/final/ llvm

pushd llvm\tools
svn co http://llvm.org/svn/llvm-project/cfe/tags/RELEASE_362/final/ clang

echo Compiling LLVM ...
cmake %~dp0llvm -DPYTHON_EXECUTABLE="C:\tools\python2\python.exe" -DSubversion_SVN_EXECUTABLE="C:\Program Files (x86)\Subversion\bin\svn.exe" -DCMAKE_INSTALL_PREFIX="C:\tools\clang" -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86;CppBackend -G "Visual Studio 12 Win64"
-G "Visual Studio 12 Win64"

cmake --build . --config Release
cmake --build . --config Release --target install
popd
