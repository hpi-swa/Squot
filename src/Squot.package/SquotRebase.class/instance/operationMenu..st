events
operationMenu: aMenu
	self activeOperation ifNotNil: [:operation | operation menu: aMenu].
	^ aMenu