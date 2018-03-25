# BDE_Cartridge_C64
BDE Cartridge for C64 (BASIC Dili Editörü Kartuşu)<br>

### Video
https://youtu.be/88fDPpDG_co

### Screenshot
![screenshot](https://github.com/emartisoft/BDE_Cartridge_C64/blob/master/screenshot.png?raw=true)

### Convert from PRG to CRT
If VICE C64 Emulator installed your system then run following commands from windows powershell. <br>

.\cartconv.exe -t normal -name "BDE Cartridge by emarti" -i bdecartridge.prg -o bdecartridge.crt <br>
.\x64.exe -cartcrt bdecartridge.crt

### To Compile
This program was coded with CBM PRG Studio [http://www.ajordison.co.uk]
