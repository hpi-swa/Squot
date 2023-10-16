menu
addModelItemsToWindowMenu: aMenu
	aMenu
		addLine;
		target: self;
		add: 'self-update' action: #actionSelfUpdate;
		add: 'set self-update branch' action: #actionSelfUpdateSetBranch.