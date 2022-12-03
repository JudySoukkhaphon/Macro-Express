 #InstallKeybdHook
UniqueID := WinExist(ahk_class IDLE Shell 3.9.7)


; ------------LEGEND--------------
; PgUp = Increment Row
; PgDn = Decrement Row
; F1	= A 
; F2	= B ...	SHIFT+F2  = C
; F3	= D
; F4	= E
; F5	= F
; F6	= G
; F7	= H
; F8	= I
; F9	= J ...	SHIFT+F9  = K
; F10	= L
; F11	= M ...	SHIFT+F11 = N
; F12	= O ... SHIFT+F12 = P

;= PgDn Previous Row ========================================================================
PgDn::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, {Control down}{Down}{Control up}
	Send, previousrow()
	Send, {Enter}
	
	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, {Control down}{Down}{Control up}
}
else
{
	return
}
return 

;= PgUp NextRow ========================================================================
PgUp::
if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, {Control down}{Down}{Control up}
	Send, nextrow()
	Send, {Enter}
	
	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, {Control down}{Down}{Control up}
}
else
{
	return
}
return

;= F1 ColumnA =======================================================================

F1::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                  
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnA("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnA("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return

;= F2 columnB =======================================

F2::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                  
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnB("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnB("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return

;=Shift+F2 columnC=======================================================================

+F2::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnC("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnC("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return

;=F3 columnD=======================================================================

F3::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnD('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnD('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return

;=F4 columnE=======================================================================

F4::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnE('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnE('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return


;=F5 columnF ==================================================================

F5::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnF('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnF('
	Send, ^+v
	Sleep, 100
	Send, ')
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return


; =F6 columnG =========================================================================

F6::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnG("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnG("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return


;=F7 columnH ==============================================================
F7::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnH("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnH("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return



;=F8 columnI ==========================================

F8::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnI("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnI("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return




;=F9 columnJ =======================================================================

F9::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnJ("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnJ("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return


;=Shift+F9 columnK============================================================================

+F9::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                  
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnK("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnK("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return


;=F10 columnL=======================================================================

F10::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnL("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}

	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnL("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return


;=F11 columnM =======================================================================

F11::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                 
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnM("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnM("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      
return

;=Shift+F11 columnN =======================================================================

+F11::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                  
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnN("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnN("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return




;=F12 columnO =======================================================================

F12::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                  
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnO("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnO("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return

;=Shift+F12 columnP =======================================================================

+F12::
ClipSaved := ClipboardAll   
clipboard := ""             
Send, ^c                    
if (SubStr(clipboard,0,1) == Chr(32))
{
	clipboard := Trim(clipboard)
}
else if (SubStr(clipboard,0,1) == ";")
{	
	clipboard := Trim(clipboard, ";")
}
else 
{
	Send, ^c                    
}
ClipWait, 1                  
if (!ErrorLevel)            

if WinExist("IDLE Shell 3.9.7")
{	WinActivate
	Send, columnP("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}	
}
else if WinExist("*IDLE Shell 3.9.7*")
{
	WinActivate
	Send, columnP("
	Send, ^+v
	Sleep, 100
	Send, ")
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	Send, {Alt down}{Tab}{Alt up}
}

clipboard := ClipSaved      ; restore original clipboard
return