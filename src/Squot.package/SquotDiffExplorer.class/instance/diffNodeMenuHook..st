ui diff tree
diffNodeMenuHook: aMenu
	<menuSquotDiffNode>
	self selectedNode ifNil: [^ aMenu].
	(artifactDiffs includesKey: self selectedNode title) ifTrue:
		[aMenu add: 'Browse original edition' action: #browseOriginalArtifactOfSelectedNode.
		aMenu add: 'Browse changed edition' action: #browseChangedArtifactOfSelectedNode.
		aMenu add: 'Inspect original edition' action: #inspectOriginalArtifactOfSelectedNode.
		aMenu add: 'Inspect changed edition' action: #inspectChangedArtifactOfSelectedNode].
	aMenu add: 'Inspect diff' action: #inspectSelectedDiffContent.
	^ aMenu