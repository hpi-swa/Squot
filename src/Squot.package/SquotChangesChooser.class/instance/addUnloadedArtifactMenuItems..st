ui menus
addUnloadedArtifactMenuItems: aMenu
	self selectedNode isArtifactNode ifFalse: [^ self].
	(self selectedNode content isMerge or: [self selectedNode content isConflict])
		ifTrue: [^ self].
	(self selectedNode artifactDiff isAddition
		or: [self selectedNode artifactDiff isRemoval not and: [(self selectedNode artifactDiff left respondsTo: #isLoaded) and: [self selectedNode artifactDiff left isLoaded not]]])
		ifTrue:
			[aMenu
				add: 'Toggle whether this will be loaded' action: #toggleLoadSelectedNode].