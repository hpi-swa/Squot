menu
changesTreeMenu: aMenu
	self selectedChange ifNotNil: [:change | change addMenuItemsTo: aMenu].
	^ aMenu