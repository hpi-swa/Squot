ui menus
addCustomMenuItemsOfSelectedNode: aMenu
	[self selectedNode content squotAddDiffNodeMenuItems: aMenu for: self]
		on: MessageNotUnderstood do:
			[:error | (error receiver == self selectedNode content and: [error message selector == #squotAddDiffNodeMenuItems:for:])
				ifTrue: [error return: nil]
				ifFalse: [error pass]].