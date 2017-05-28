ui diff tree
diffNodeMenuHook: aMenu
	<menuSquotDiffNode>
	self selectedNode ifNil: [^ aMenu].
	self selectedNode offersChoice
		ifTrue: [aMenu
			add: 'Choose this edition' action: #activateSelectedNode;
			add: 'Choose already loaded edition' action: #deactivateSelectedNode;
			add: 'Reset choice' action: #resetChoiceForSelectedNode]
		ifFalse: [self selectedNode isActive
			ifTrue: [aMenu add: 'Skip this change' action: #deactivateSelectedNode]
			ifFalse: [aMenu add: 'Consider this change' action: #activateSelectedNode]].
	aMenu add: 'Inspect diff' action: #inspectSelectedDiffContent.
	(artifactDiffs includesKey: self selectedNode title) ifTrue:
		[aMenu add: 'Inspect currently loaded edition' action: #inspectOriginalArtifactOfSelectedNode.
		aMenu add: 'Inspect edition that is available to be loaded' action: #inspectProposedArtifactOfSelectedNode].
	^ aMenu