utilities
performUiTestsOnToolBuiltBy: aToolBuilder
	| treeView |
	treeView := aToolBuilder widgetAt: 'hierarchical diff'.
	tool rootNodes do: [:root | root withAllChildren do: [:each |
			self performUiInteractionTestsOnNode: each inTree: treeView]].