ui menus
addCustomMenuItemsOfSelectedNode: aMenu
	| object |
	object := self selectedNode content.
	(object respondsTo: #squotAddDiffNodeMenuItems:for:) ifTrue:
		[object squotAddDiffNodeMenuItems: aMenu for: self].