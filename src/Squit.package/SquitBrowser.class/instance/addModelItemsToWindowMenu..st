ui menu
addModelItemsToWindowMenu: aMenu
	aMenu addLine.
	aMenu
		add: 'self-update...'
		target: self
		selector: #actionSelfUpdate;
		add: 'set self-update branch...'
		target: self
		selector: #actionSelfUpdateSetBranch.
	aMenu balloonTextForLastItem: 'Update and reopen Git Browser.'