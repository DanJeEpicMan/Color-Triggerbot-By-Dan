#SingleInstance, Focre
CoordMode,Mouse Pixel,Screen


Gui, Add, Button, x10 y10 w280 h30 gGet_Color , Color Picker 
Gui, +AlwaysOnTop


Gui, Show, w300 h50, PixelGetColor
return


GuiClose:
	ExitApp

Get_Color:
	i :=1
	Loop
		{
		Left_Mouse := GetKeyState("NumPad9")
		Right_Mouse := GetKeyState("NumPad0")
		if(Left_Mouse==False&&i==1)
			i :=1
		else if(Left_Mouse==True&&i==1)
			{
			 	MouseGetPos,X,Y
				PixelGetColor, Our_Color, X,Y,RGB
				Gui, Color, %Our_Color%
				If Our_Color=0xFFFFFF, {
				
 					send, {LButton down}
				}
				else, {
					send, {LButton up}
					
				}
			}
			if(Right_Mouse==True)
				NumPad0::Pause
		
	return

^NumPad0::ExitApp
