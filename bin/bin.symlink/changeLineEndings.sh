#!/bin/sh
repodirs=".git .svn CVS .hg .bzr _darcs"
for dir in $repodirs; do
    repo_ign="$repo_ign${repo_ign+" -o "}-name $dir"
done

txtfiles="
txt
md
mkd
bat
cmd
sh
cs
aspx
ascx
asax
html
cshtml
Master
coffee
less
js
css
xml
xslt
xsd
xsl
manifest
config
sln
csproj
user
proj
tt
[Tt]argets
resharper
url
Targets.sample
StyleCop
conf
rtf
plugin
addin
tdnet
py
template
kpf
json
wpr
feature
Cache
nunit"

for ext in $txtfiles; do
    files_inc="$files_inc${files_inc+"\\|"}$ext"
done

#find $1 -type f -regex ".*\($files_inc\)$" -print

find $1 \( -type d -a \( $repo_ign \) \) -prune -o \
       \( -type f -regex ".*\($files_inc\)$" -print0 \) |
xargs -r0 dos2unix.exe -D
