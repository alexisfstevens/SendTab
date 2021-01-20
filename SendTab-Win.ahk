; Send Tab To Devices
#IfWinActive ahk_class Chrome_WidgetWin_1
!s::
FileDelete, {filepath}\siteshare.json
Send, ^l
Send, ^a
Send, ^c
FileAppend, {`"url`":`"%clipboard%`"}, {filepath}\siteshare.json
return

; Open Tab From Devices
#IfWinActive ahk_class Chrome_WidgetWin_1
!a::
FileRead, Site, {filepath}\siteshare.json
Site := SubStr(Site, 9, StrLen(Site)-2)
Site := SubStr(Site, 1, StrLen(Site)-2)
Site := StrReplace(Site, "\/", "/")
Run, "%Site%"
return