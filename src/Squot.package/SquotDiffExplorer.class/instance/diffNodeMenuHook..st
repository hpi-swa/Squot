ui diff tree
diffNodeMenuHook: aMenu
	<menuSquotDiffNode>
	self selectedNode ifNil: [^ aMenu].
	self selectedNode isArtifactNode ifTrue:
		[aMenu add: 'Browse original edition' action: #browseOriginalArtifactOfSelectedNode.
		aMenu add: 'Browse changed edition' action: #browseChangedArtifactOfSelectedNode].
	aMenu add: 'Browse loaded edition' action: #browseLoadedEditionOfSelectedNode.
	self selectedNode isArtifactNode ifTrue:
		[aMenu add: 'Inspect original edition' action: #inspectOriginalArtifactOfSelectedNode.
		aMenu add: 'Inspect changed edition' action: #inspectChangedArtifactOfSelectedNode].
	aMenu add: 'Inspect diff' action: #inspectSelectedDiffContent.
	^ aMenu