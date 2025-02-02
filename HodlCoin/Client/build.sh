#!/bin/sh
curl -sSL https://dot.net/v1/dotnet-install.sh > dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh -c 7.0 -InstallDir ./dotnet
./dotnet/dotnet --version
./dotnet/dotnet workload install wasm-tools
./dotnet/dotnet publish -c Release -o output
#Only keep the br/gzip files for filesize limit
rm -rf output/wwwroot/_framework/*.wasm
rm -rf output/wwwroot/_framework/*.dll