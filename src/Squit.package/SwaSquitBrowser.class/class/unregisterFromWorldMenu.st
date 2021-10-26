world menu
unregisterFromWorldMenu
	"self unregisterFromWorldMenu"
	(self environment valueOf: #TheWorldMenu) ifNotNil:
		[:worldMenu | worldMenu unregisterOpenCommandWithReceiver: self].