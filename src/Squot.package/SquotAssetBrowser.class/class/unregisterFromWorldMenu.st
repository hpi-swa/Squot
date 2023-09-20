world menu
unregisterFromWorldMenu
	(self environment valueOf: #TheWorldMenu) ifNotNil:
		[:worldMenu | worldMenu unregisterOpenCommandWithReceiver: self].