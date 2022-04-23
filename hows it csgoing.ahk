 ; everything behind the semicolon is notes and not part of the code
 ; This code is split into 3 section removing section 2 & 3 will not break the code
#NoEnv
CoordMode, Pixel, Screen ; This sets all color related code to be related to screen
CoordMode, Mouse, Screen ; This sets all Mouse related code to be related to screen

Gui, Add, Text, x9 y+3, Close this tab to stop the hack, if minimised it will still run ; adds text to the gui
Gui, Add, Text, x9 y+3, Click 'Start Triggerbot' then, hold 0 to use in game ; adds text to the gui
Gui, Add, Text, x9 y+3, If gui red then triggerbot active ; adds text to the gui
Gui, Add, Button, x9 y+5 w280 h25 gESP , Start ESP ; adds button to gui
Gui, Add, Button, x9 y+5 w138 h25 gGet_Color , Start Triggerbot ; adds button to gui
Gui, Add, Button, x150 y83 w138 h25 gStop_Get_Color , Stop Triggerbot ; adds button to gui
Gui, Add, Button, x9 y+5 w280 h25 ghel , Help ; adds the help button to gui


Gui, Show, , PixelGetColor ; gui size, w500 h300
return


GuiClose: ; makes it so that when the tab is closed the script ends
	ExitApp

hel: ; this is the help function 
	Msgbox, Github to help you (https://github.com/DanJeEpicMan/Color-Triggerbot-By-Dan) ; dysplays box 
return 

Random, rad , 80, 190 

Get_Color: ; function related to the button
	funk := 0
	Loop ; loops when button is pressed
		{
		Gui, Color, 0xFF6060
		Left_Mouse := GetKeyState("0") ; Left_Mouse is a variable and the button to activae the trigger is NumPad9 witch can be changed
		Right_Mouse := GetKeyState("NumPad0") ;Right_Mouse is a variable and the button to stop and is bound to NumPad0
		if(Left_Mouse==True) ; checks if Left_Mouse is true and theirfor if NumPad9 is pressed
		{
			PixelSearch, Px, Py, 1278, 751, 1288, 741, 0x20FFFF, 32, Fast RGB ; !!!!( this provides an explonation)change the numbers to fit the screen,  Px and Py are variables where the colors are located, the numbesr are where it checks, the 0x... is the color, 20 how far off the color can be (look up RGB for more info, Fast is the way it scans, RGB is the color method
				if not ErrorLevel ; check is the color was not found
				{
    				MouseClick, Left
					sleep, rad
				
				}
				
		}
		if(Right_Mouse==True) ; checks if NumPad0 is pressed
			break ; stops the script

		if(funk==1) ; checks for Stop_Get_Color
			Break

		}
	return ; runs loop again

Stop_Get_Color:
Gui, Color, 0xFFFFFF
funk := 1
return

; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Senction 2-ESP=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

ESP: ;I HAVE NO IDEA HOW THIS FUNCTION WORKS I JUST PASTED IT

_Switch := !_Switch 

_Data := _Switch 
_Size = 1
 
VarSetCapacity(_Value, _Size, 0)
NumPut(_Data, _Value, "UInt")
 
Process, Exist, csgo.exe
 
if (!ErrorLevel) 
  MsgBox,,unknowncheats.me,[!] Process not found.
 
_ProcessID := ErrorLevel
_Address := _GetAddress()
_Process := DllCall("OpenProcess", "UInt", 0x20 | 0x8, "Int", False, "UInt", _ProcessID)

if (!_Process) 
   MsgBox,,unknowncheats.me,[!] Failed to open process.
 
_Write := DllCall("WriteProcessMemory", "UInt", _Process, "UInt", _Address, "UInt", &_Value, "UInt", _Size, "UInt", 0)
 
DllCall("CloseHandle", "UInt", _Process)
 
if (!_Write) 
  MsgBox,,unknowncheats.me,[!] Failed to write.
return

_GetAddress()
{
	_Snapshot := DllCall("CreateToolhelp32Snapshot", "Uint", 0x8, "Uint", ErrorLevel)
	
	if (_Snapshot = -1) 
		Return 0
	
	VarSetCapacity(_Module, 548, 0)
	NumPut(548, _Module, "Uint")

	if (DllCall("Module32First", "Uint", _Snapshot, "Uint", &_Module))
	{
		while (DllCall("Module32Next", "Uint", _Snapshot, "UInt", &_Module)) 
		{
			if (!DllCall("lstrcmpi", "Str", "client.dll", "UInt", &_Module + 32)) 
			{
				DllCall("CloseHandle", "UInt", _Snapshot)
				
				Return NumGet(&_Module + 20) + 1896792
			}
		}
	}
	
	DllCall("CloseHandle", "Uint", _Snapshot)

	Return 0
}

; =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Senction 3-No Recoil=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; just past a recoil script cus im too lazy

 

^NumPad0::ExitApp ; ctrl+NumPad0 exists the entire program
