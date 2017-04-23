ui menu
addModelItemsToWindowMenu: aMenu
	aMenu addLine.
	aMenu
		add: 'self-update...'
		target: self
		selector: #actionSelfUpdate.
	aMenu balloonTextForLastItem: 'Update and reopen Git Browser.'