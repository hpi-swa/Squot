utilities
treeViewMenuIncludesAction: aSymbol
	| view menu |
	^ [view := self openTool.
	menu := (toolBuilder widgetAt: 'hierarchical diff') getMenu: false.
	menu items anySatisfy: [:each | aSymbol = each selector]]
		ensure: [self closeTool: view].