ui diff tree
diffNodeMenuHook: aMenu
	<menuSquotDiffNode>
	self selectedNode ifNil: [^ aMenu].
	aMenu add: 'Browse original edition' action: #browseOriginalObject.
	aMenu add: 'Browse modified edition' action: #browseModifiedObject.
	aMenu add: 'Browse loaded edition' action: #browseLoadedEditionOfSelectedNode.
	self selectedNode isArtifactNode ifTrue:
		[aMenu add: 'Inspect original edition' action: #inspectOriginalArtifactOfSelectedNode.
		aMenu add: 'Inspect modified edition' action: #inspectChangedArtifactOfSelectedNode].
	aMenu add: 'Inspect diff' action: #inspectSelectedDiffContent.
	^ aMenu