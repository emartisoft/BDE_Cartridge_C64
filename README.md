# BDE_Cartridge_C64
BDE Cartridge for C64 (BASIC Dili Editörü Kartuşu)

![screenshot](https://github.com/emartisoft/BDE_Cartridge_C64/blob/master/screenshot.png?raw=true)

### Convert from PRG to CRT
Open Windows Powershell

cd "VICE C64 Emulator Path" <br>
.\cartconv.exe -t normal -name "BDE Cartridge by emarti" -i bdecartridge.prg -o bdecartridge.crt <br>
.\x64.exe -cartcrt bdecartridge.crt

### To Compile
This program was coded in CBM PRG Studio [http://www.ajordison.co.uk]
