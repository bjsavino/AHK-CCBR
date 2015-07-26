#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

objWMIService := ComObjGet( "winmgmts:{impersonationLevel=impersonate}!\\.\root\CIMV2" )
colItems := objWMIService.ExecQuery("Select * from Win32_NetworkAdapter")._NewEnum
While colItems[objItem] {
	txt:=A_Index . " - Adapter: " . ObjItem.Name . ", Speed:" . round(objItem.speed / 1000000,1) . "MBps`n"
	if (ObjItem.NetconnectionStatus = 2)
	 FileAppend, %txt%, conexões.txt
}
Return