#NoEnv
#Persistent
#SingleInstance force
#NoTrayIcon

SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode Mouse, Screen

SplitPath A_ScriptName,,,, iniFilename
iniFilename := iniFilename . ".ini"

if !FileExist(iniFilename) {
	MsgBox Missing %iniFilename%
	ExitApp
}

IniRead buttonSize, %iniFilename%, Default, buttonSize, 200
IniRead pressTime, %iniFilename%, Default, pressTime, 1000
IniRead targetExecutable, %iniFilename%, Default, targetExecutable, "calc.exe"

pressTimeOnce := -1 * pressTime

return

*~LButton::
	MouseGetPos mouseX, mouseY
	x1 := A_ScreenWidth - buttonSize
	x2 := A_ScreenWidth - 1
	y1 := 0
	y2 := buttonSize - 1
	if ((mouseX >= x1) && (mouseX <= x2) && (mouseY >= y1) && (mouseY <= y2)) {
		SetTimer CloseApp, %pressTimeOnce%
	}
	return

*~LButton Up::
	SetTimer CloseApp, Off
	return

CloseApp:
	WinClose ahk_exe %targetExecutable%
	return
	