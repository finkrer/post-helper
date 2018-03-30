!1::
	Reload
Return

AppsKey::
	Send, ^02
Return

RWin::
	Send, ^00{Enter}
Return

#IfWinActive UFDispatchClient
\::
	ControlGetText, name1, WindowsForms10.EDIT.app.0.a0f91b_r14_ad112
	ControlGetText, name2, WindowsForms10.EDIT.app.0.a0f91b_r14_ad113
	ControlGetText, name3, WindowsForms10.EDIT.app.0.a0f91b_r14_ad114
	Send, {Right}
	Sleep, 1000
	Send, {Enter}
	Send, %name1% %name2% %name3%
	If (name3 = "")
		Send, {BackSpace}
	If (name2 = "")
		Send, {BackSpace}

Return
#IfWinActive

#IfWinActive Почтовый терминал
\::
	Send, ^12
	Send, ста{Enter}
	Send, ^13
	Send, 620142
	Send, ^15
	Send, {Delete}
	Send, ^16
	Send, е{Enter}
	Sleep, 1000
	Send, ^18

Return
#IfWinActive

#IfWinActive Атрибуты РПО
\::
	ControlClick, WindowsForms10.Window.b.app.0.a0f91b_r14_ad163
	Sleep, 1000
	Send, {Enter}
Return

Numpad0::
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad116
	Send, {F4}
Return

Numpad1::
	ControlClick, WindowsForms10.Window.8.app.0.a0f91b_r14_ad115
	Send, {F4}
Return

Numpad4::
	ControlFocus, WindowsForms10.Window.b.app.0.a0f91b_r14_ad119
	Sleep, 100
	Send, 04{Enter}
Return

Numpad5::
	ControlFocus, WindowsForms10.Window.b.app.0.a0f91b_r14_ad114
	Sleep, 100
	Send, {Alt}{Enter}
	Send, {F4}
	Sleep, 1400
	Send, {Down}{Enter}
	Send, ^02
Return
#IfWinActive