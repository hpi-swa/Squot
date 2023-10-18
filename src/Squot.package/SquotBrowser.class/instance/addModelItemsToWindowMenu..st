menu
addModelItemsToWindowMenu: aMenu
	aMenu
		addLine;
		target: self;
		add: 'self-update' action: #actionSelfUpdate.