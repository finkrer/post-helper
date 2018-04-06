#IfWinActive UFDispatchSimpleSmallParcel
\::
	Send, ^16
	Send, {ctrl down}c{ctrl up}
	Send, {enter}
	Send, {ctrl down}v{ctrl up}
	Loop, 4
		Send, {enter}
	Sleep, 2000
	Send, {enter}
Return
#IfWinActive

#IfWinActive UFDispatchClient
\::
	FindRecepient()
Return

NumpadEnter::
	FindRecepient()
Return

FindRecepient()
{
	Send, {ctrl}12
	Send, ^a^c
	Sleep, 100
	Surname := Clipboard
	MsgBox, %Surname%
	Clipboard :=
	Send, {ctrl}13
	Send, ^a^c
	Sleep, 100
	FirstName := Clipboard
	Clipboard :=
	Send, {ctrl}14
	Send, ^a^c
	Sleep, 100
	Patronymic := Clipboard
	Name := Surname . " " . FirstName . " " . Patronymic
	Clipboard :=
	Send, {ctrl}04
	Clipboard := Name
	Sleep, 100
	Send, ^v
	Send, {ctrl}02
	Loop, 5
		Send, {tab}
	Send, {up}
	Send, {ctrl}01
	Sleep, 3000
	IfWinActive, Сообщение
	{
		Send, {enter}
		Name := Surname . " " . SubStr(FirstName, 1, 1) . " " . SubStr(Patronymic, 1, 1)
		Clipboard := Name
		Sleep, 100
		Send, {ctrl}11
		Send, ^a
		Send, ^v
		Send, {ctrl}02
		Loop, 5
			Send, {tab}
		Send, {up}
		Send, {ctrl}01
		Sleep, 1000
		Send, {ctrl}12
		Send, %Surname%
		Send, {ctrl}13
		Send, %FirstName%
		Send, {ctrl}14
		Send, %Patronymic%
		Sleep, 1000
	}
	IfWinActive, Сообщение
	{
		Send, {enter}
		Send, {ctrl}00
		Send, {enter}
		Send, {ctrl}02
		WinWaitActive, Атрибуты РПО
		GoToAddress()
		Return
	}
	Send, {ctrl}02
	Sleep, 5000
Return
}

TryInitials()
{
	Send, {enter}
	Name := Surname . " " . SubStr(FirstName, 1, 1) . " " . SubStr(Patronymic, 1, 1)
	Clipboard := Name
	Sleep, 100
	Send, {ctrl}11
	Send, ^a
	Send, ^v
	Send, {ctrl}02
	Loop, 5
		Send, {tab}
	Send, {up}
	Send, {ctrl}01
	Sleep, 1000
	Send, {ctrl}12
	Send, %Surname%
	Send, {ctrl}13
	Send, %FirstName%
	Send, {ctrl}14
	Send, %Patronymic%
	Sleep, 1000
Return
}
#IfWinActive

#IfWinActive Атрибуты РПО
\::
	FinishPacket()
Return

FinishPacket1()
{
	Click, 950, 400
	Loop, 6
		Send, {tab}
	Send, {ctrl down}c{ctrl up}
	Send, {shift down}{tab}{shift up}
	Send, {ctrl down}v{ctrl up}
	Loop, 9
		Send, {tab}
	Send, {enter}
	Sleep, 3000
	IfWinActive, Сообщение
		Send, {Enter}
	WinWaitClose, Атрибуты РПО
	WinWaitActive, Атрибуты РПО																																																																																																				
	;FillName()
}

FinishPacket()
{
	ControlGetText, weight, WindowsForms10.EDIT.app.0.3e799b_r13_ad111
	weight := StrReplace(weight, "кг", "0")
	ControlFocus, WindowsForms10.EDIT.app.0.3e799b_r13_ad18
	Send, %weight%
	ControlClick, WindowsForms10.Window.b.app.0.3e799b_r13_ad128
	Sleep, 3000
	IfWinActive, Сообщение
		Send, {Enter}
	WinWaitClose, Атрибуты РПО
	WinWaitActive, Атрибуты РПО
	;Sleep, 3000
	;ControlGetText, text, WindowsForms10.Window.b.app.0.3e799b_r13_ad165
	;if text = [Значение не выбрано]																																																																																																				
		;FillName()
}

FinishLetter()
{
	Click, 950, 400
	Loop, 4
		Send, {tab}
	Send, {f4}
	Send, 04
	Send, {enter}
	Loop, 8
		Send, {tab}
	Send, {enter}
	WinWaitClose, Атрибуты РПО
	WinWaitActive, Атрибуты РПО
	Sleep, 500
	FillName()
}

GoToAddress()
{
	Click, 750, 800
	WinWaitActive, Почтовый терминал
	Sleep, 500
	AutofillAddress()
}

AutofillAddress()
{
	Send, {ctrl}13
	Sleep, 200
	Send, 620036
	Sleep, 200
	Send, {ctrl}14
	Send, СВ
	Sleep, 1000
	Send, {ctrl}16
	Sleep, 200
	Send, Е
	Send, {ctrl}17
}

FillName()
{
	Click, 250, 800
	;ControlClick, WindowsForms10.Window.8.app.0.3e799b_r13_ad115
	Send, {f4}
	Sleep, 200
	Send, {enter}
}


Numpad1::
	;ControlGetText, text, WindowsForms10.Window.b.app.0.3e799b_r13_ad165
	;MsgBox, %text%
	FillName()
Return

Numpad0::
	GoToAddress()
Return
#IfWinActive

#IfWinActive Почтовый терминал
\::
	AutofillAddress()
Return

FillStreet(district, street)
{
	Send, {ctrl down}a{ctrl up}
	Send, {ctrl down}x{ctrl up}
	Send, {ctrl}17
	Send, %district%{ctrl}18
	Sleep, 500
	Send, %street%{ctrl}19
	Sleep, 500
	StringSplit, Address, Clipboard, " "
	Send, %Address1%{delete}
	Loop, 3 {
		Send, {enter}
		Sleep, 500
	}
	Send, %Address2%
	Loop, 2
		Send, {enter}
	Sleep, 5000
Return
}

:?:САВ::
	FillStreet("МИ", "ЕВ")
Return

:?:СОБ::
	FillStreet("", "СО")
Return

:?:КАР::
	FillStreet("МИ", "К")
Return

:?:ФЕО::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "Ф")
Return

:?:МУР::
	FillStreet("", "МУ")
Return

:?:БРУ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "БР")
Return

:?:ПИК::
	FillStreet("", "П")
Return

:?:СУХ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "СУ")
Return

:?:ПРО::
	FillStreet("", "ПР")
Return

:?:ТЕР::
	FillStreet("МИ", "Т")
Return

:?:ГОЛ::
	FillStreet("", "ГО")
Return

:?:ШИР::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "Ш")
Return

:?:МАЙ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "М")
Return

:?:КЛЮ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "КЛЮ")
Return

:?:СМО::
	FillStreet("", "С")
Return

:?:ЧЕР::
	FillStreet("", "ЧЕРН")
Return

:?:ХРУ::
	FillStreet("", "Х")
Return

:?:ЛАН::
	FillStreet("", "Л")
Return

:?:ЦВЕ::
	FillStreet("МИ", "Ц")
Return

:?:ЯГО::
	FillStreet("", "Я")
Return

:?:ОСО::
	FillStreet("МИ", "О")
Return

:?:ЛИС::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "ЛИС")
Return

:?:ОХО::
	FillStreet("", "ОХ")
Return

:?:ЗЕМ::
	FillStreet("", "ЗЕ")
Return

:?:МГР::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "МЕДНО")
Return

:?:МЕД::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "МЕ")
Return

:?:МАЛ::
	FillStreet("", "М")
Return

:?:ЛИС::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "ЛИС")
Return

:?:УДЕ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "У")
Return

:?:ПОД::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "ПО")
Return

:?:КЫТ::
	FillStreet("", "КЫ")
Return

:?:ЦЕН::
	FillStreet("ШИРОКАЯ РЕЧКА П", "Ц")
Return

:?:МЯТ::
	FillStreet("", "МЯ")
Return

:?:РЕЗ::
	FillStreet("", "Р")
Return

:?:КОЖ::
	FillStreet("", "ПЕТРА КОЖЕМЯКО БУЛ.")
Return

:?:УЧЕ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "УЧ")
Return

:?:ВАС::
	FillStreet("", "В")
Return

:?:ДАЛ::
	FillStreet("", "Д")
Return

:?:КЛЕ::
	FillStreet("ШИРОКАЯ РЕЧКА ПГ", "КЛ")
Return

:?:ПИХ::
	FillStreet("", "ПИХ")
Return
#IfWinActive

#IfWinActive Сообщение
\::
		()
Return

StartDelivery()
{
	Send, {enter}
	Send, {ctrl}11
	Loop, 3 {
		Send, {enter}
	}
	Send, {alt}{enter}
	WinWaitActive, UFHandleRPO
	Sleep, 200
	Send, {shift down}{tab}{shift up}
	Send, 20
	Send, {ctrl down}a{ctrl up}
}
#IfWinActive

#IfWinActive UFHandleRPO
\::
NumpadEnter::
	Send, {ctrl}02
	Sleep, 200
	Send, {enter}{enter}
	Send, 1
Return
#IfWinActive

NumpadSub::
	Loop
	{
		WinWaitActive, Сообщение
		IfWinNotActive, Сообщение
			continue
		Send, {right}
		ControlGetFocus, control, Сообщение
		ControlGetText, text, %control%
		if text = Отмена
			StartDelivery()
		else if text = Cancel
		{
			Send, {enter}
			Send, +{tab}
		}
	}
Return

AppsKey::
	Send, {ctrl}02
Return

RWin::
	Send, {ctrl}00
Return

~::
	Reload