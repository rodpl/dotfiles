Building VIM x64 on Windows
---------------------------

1.  Get sources `hg clone https://vim.googlecode.com/hg/ vim`
2.  Install Windows SDK 7.1 [http://www.microsoft.com/en-us/download/confirmation.aspx?id=8279]
    If installation failed check this [http://www.mathworks.com/matlabcentral/answers/95039-why-does-the-sdk-7-1-installation-fail-with-an-installation-failed-message-on-my-windows-system]
3.  Instal patch for SDK 7.1 [http://www.microsoft.com/en-us/download/confirmation.aspx?id=4422]


Buildling llvm

According to [http://solar-blogg.blogspot.com/2013/04/build-llvmclang-33-on-windows-x64.html]
1. `svn co http://llvm.org/svn/llvm-project/llvm/tags/RELEASE_351/final/ llvm`
2.  cd llvm\tools
3.  `svn co http://llvm.org/svn/llvm-project/cfe/tags/RELEASE_351/final/ clang`
