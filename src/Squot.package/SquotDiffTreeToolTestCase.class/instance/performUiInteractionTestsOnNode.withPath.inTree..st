utilities
performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView 
	tool selectNode: aSquotDiffNode;
		selectedNodePath: aCollection.
	treeView expandAll.
	tool nodeLabelOf: aSquotDiffNode.
	self assert: (tool diffText isString or: [tool diffText isText]).
	treeView getMenu: false.
	treeView getMenu: true.