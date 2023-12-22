git porcelain - external
knownTerminalCommands
	^ {
		'alacritty -e'.
		'gnome-terminal --'.
		"'guake --show -e'." "command needs proper quoting"
		'kitty'.
		'konsole -e'.
		'terminator -x'.
		"'tilda -c'." "-c doesn't work properly"
		'tilix -e'.
		'urxvt -e'.
		'xfce4-terminal -x'.
		'xterm -e'.
		"'yakuake'." "needs dbus for scripting"
	}