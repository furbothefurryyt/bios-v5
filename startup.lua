-- some informaton pre-boot
print("just fyi, this thing is still wip soooo dont expect an actual ui yet ok tyty")
print("for changing boot paths, go to line 52")

-- setting version variables
local version = 5
local subversion = 2
local hotfix = 1

-- initialize all the peripherals needed
local monitor = peripheral.find("monitor")
local speaker = peripheral.find("speaker")
local modem = peripheral.find("modem")
local drive = peripheral.find("drive")

-- checking for all peripherals needed
if monitor then
    print("(i) Monitor found.")
else
    printError("(!) No monitor found!")
    sleep(1)
end

if speaker then
    print("(i) Speaker found.")
else
    printError("(!) No speaker found.")
    sleep(1)
end

if modem then
    print("(i) WLAN/WAN access avaliable.")
else
    printError("(!) WLAN/WAN access unavaliable, please mount a modem to any side of this computer, and run 'reboot'.")
    sleep(1)
end

if drive then
    print("(i) CD/ROM found, bootable media is possible.")
else
    print("(!) No CD/ROM was found, please mount a drive to be able to boot files.")
    sleep(1)
end

-- setting custom colors
monitor.setPaletteColor(colors.red, 0xCC7575)
monitor.setPaletteColor(colors.orange, 0xCCCC75)
monitor.setPaletteColor(colors.green, 0x75CC75)
monitor.setPaletteColor(colors.lightGray, 0xCCCCCC)

-- searching and running the disk
local programPath = "disk/main.lua" or "disk/bootloader.lua" or "disk/startup.lua"

if fs.exists(programPath) then
    print("(i) A disk was found. Booting...")
    shell.run(programPath)
else
    printError("(!) No disk was found!")
end
