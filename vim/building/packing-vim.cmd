@echo on

echo Packing vim...
pushd vim\src

:: clean
rd /s /q tempoutput

:: create output directory ...
if not exist tempoutput mkdir tempoutput
if not exist tempoutput mkdir tempoutput\x64

:: Coping to right directory
xcopy /E /Q ..\runtime tempoutput\x64\
copy ..\vimtutor.* tempoutput\x64\
copy xxd\xxd.exe tempoutput\x64\
copy *.exe tempoutput\x64\
copy vimtbar.dll tempoutput\x64\
copy README.txt tempoutput\x64\

if not exist tempoutput\x64\GVimExt mkdir tempoutput\x64\GVimExt
if not exist tempoutput\x64\VisVim mkdir tempoutput\x64\VisVim

copy gvimext\*.dll tempoutput\x64\gvimext\
copy gvimext\*.inf tempoutput\x64\gvimext\
copy gvimext\*.reg tempoutput\x64\gvimext\
copy gvimext\README.txt tempoutput\x64\gvimext\

copy VisVim\*.txt tempoutput\x64\VisVim\
copy VisVim\*.dll tempoutput\x64\VisVim\
copy VisVim\*.bat tempoutput\x64\VisVim\


:: cleanup
del tempoutput\x64\vimlogo.*
del tempoutput\x64\*.png
del tempoutput\x64\vim??x??.*


:: pack it!

cd tempoutput\x64
7z a -mx=9 -r -bd ..\complete-x64.7z *

popd
