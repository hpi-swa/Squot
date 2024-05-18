git porcelain - external
knownTerminalCommands
	^ {
		'alacritty -e {}'.
		'cool-retro-term -e {}'.
		'deepin-terminal -e {no-key}'.
		'foot -- {}'.
		'gnome-terminal --wait -- {}'.
		"'guake --show -e {quote}'." "doesn't work properly"
		"'io.elementary.terminal -x {}'." "doesn't work properly"
		'kgx -e {}'.
		'kitty {}'.
		'konsole -e {}'.
		'lxterminal -e {}'.
		'mate-terminal -x {}'.
		'osascript -e ''tell app "Terminal" to do script "{":\",'':''"''"''}"'''.
		'st -e {}'.
		'terminator -x {}'.
		'terminology -e {quote}'.
		"'tilda -c {}'." "-c doesn't work properly"
		'tilix -e {}'.
		'urxvt -e {}'.
		'xfce4-terminal -x {}'.
		'xterm -e {}'.
		"'yakuake {}'." "needs dbus for scripting"
	}