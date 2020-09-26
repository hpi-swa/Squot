utilities
performUiTestsOnToolBuiltBy: aToolBuilder
	| treeView remaining currentPath |
	treeView := aToolBuilder widgetAt: 'hierarchical diff'.
	remaining := OrderedCollection new.
	tool rootNodes reverseDo: [:each | remaining add: (Array with: each)].
	[remaining isEmpty] whileFalse:
		[currentPath := remaining removeLast.
		self performUiInteractionTestsOnNode: currentPath first withPath: currentPath inTree: treeView.
		currentPath first children reverseDo:
			[:each | remaining add: (currentPath copyWithFirst: each)]].