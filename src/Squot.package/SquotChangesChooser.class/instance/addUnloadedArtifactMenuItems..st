ui menus
addUnloadedArtifactMenuItems: aMenu
	(self selectedNode isArtifactNode and: [self canBeLoaded: self selectedNode]) ifFalse: [^ self].
	aMenu
		add: 'Toggle whether this will be loaded' action: #toggleLoadSelectedNode.