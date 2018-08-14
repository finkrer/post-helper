#IfWinActive UFDispatchSimpleSmallParcel
\::
	Send, ^15
	Send, про
	Sleep, 200
	Send, {Enter}
	Send, ^16
	Send, ^a^c
	Send, ^17
	Send, ^a^v
	Send, ^02
	Sleep, 3000
	IfWinActive, Сообщение
		Send, {Enter}
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
	ControlGetText, Surname, WindowsForms10.EDIT.app.0.a0f91b_r14_ad112
    ControlGetText, FirstName, WindowsForms10.EDIT.app.0.a0f91b_r14_ad113
    ControlGetText, Patronymic, WindowsForms10.EDIT.app.0.a0f91b_r14_ad114
	Name := Surname . " " . FirstName . " " . Patronymic
	Clipboard :=
	;Send, {ctrl}04
	Clipboard := Name
	Sleep, 100
	Send, {Right}
	Sleep, 200
	Send, {Enter}
	Send, ^v
	Goto, Skip
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
		Send, ^a%Surname%
		Send, {ctrl}13
		Send, ^a%FirstName%
		Send, {ctrl}14
		Send, ^a%Patronymic%
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
	Skip:
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
RButton::
\::
	FinishPacket()
Return

FinishPacket()
{
	ControlGetText, weight, WindowsForms10.EDIT.app.0.a0f91b_r14_ad111
	foundPos := InStr(weight, "кг")
	if foundPos = 0
		Goto, InsertWeight
	kilograms := SubStr(weight, 1, foundPos - 1)
	grams := SubStr(weight, foundPos + 2, StrLen(weight) - foundPos - 3)
	EnvMult, kilograms, 1000
	weight := kilograms + grams
	InsertWeight:
	ControlFocus, WindowsForms10.EDIT.app.0.a0f91b_r14_ad18
	ControlGetFocus, control
	if control = WindowsForms10.EDIT.app.0.a0f91b_r14_ad18
		Send, ^a%weight%
	ControlClick, WindowsForms10.Window.b.app.0.a0f91b_r14_ad128
	Sleep, 3000
	IfWinActive, Сообщение
		Send, {Enter}
	WinWaitClose, Атрибуты РПО
	WinWaitActive, Атрибуты РПО
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
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad116
	Send, {F4}
	WinWaitActive, Почтовый терминал
	Sleep, 500
	Send, {ctrl}18
}

AutofillAddress()
{
	Send, {ctrl}12
	Sleep, 200
	Send, ста
	Sleep, 200
	Send, {enter}
	Send, {ctrl}13
	Sleep, 200
	Send, 620092
	Send, {ctrl}18
}

FillName()
{
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad115
	Send, {f4}
	Sleep, 200
}


Numpad1::
	FillName()
Return

Numpad0::
	GoToAddress()
Return

Numpad2::
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad117
	Send, {f4}
Return

Numpad3::
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad118
	Send, {f4}
Return

Numpad4::
	ControlClick, WindowsForms10.Window.b.app.0.a0f91b_r14_ad119
	Sleep, 200
	Send, 04
	Sleep, 200
	Send, {Enter}
Return

Numpad5::
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad17
	Send, {Alt}{Enter}
	Sleep, 200
	Send, {F4}
	Sleep, 200
	Send, воз
	Send, {Enter}
	Sleep, 200
	Send, ^02
Return
#IfWinActive

#IfWinActive Почтовый терминал
\::
	AutofillAddress()
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
	;Send, {shift down}{tab}{shift up}
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
	Send, {ctrl}00{Enter}
Return

!1::
	Reload