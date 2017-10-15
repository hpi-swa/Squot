testing
openToolAndTestOnPatch: aPatch
	| toolBuilder treeView |
	selectionTool := SquotChangedArtifactsChooser on: aPatch.
	toolBuilder := ToolBuilder default.
	view := toolBuilder open: selectionTool label: self selector.
	treeView := toolBuilder widgetAt: 'hierarchical diff'.
	selectionTool rootNodes do: [:root | root withAllChildren do: [:each |
			selectionTool selectNode: each.
			treeView expandAll.
			selectionTool nodeLabelOf: each.
			selectionTool deactivateSelectedNode.
			selectionTool activateSelectedNode]].
	selectionTool accept.
	toolBuilder close: view.
	selectionTool selectedPatch.