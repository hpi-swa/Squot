ui menus
diffNodeMenuHook: aMenu
	<menuSquotDiffNode>
	self selectedNode ifNil: [^ aMenu].
	self selectedNode offersChoice
		ifTrue: [aMenu
			add: self chooseRightCommandLabel action: #activateSelectedNode;
			add: self chooseLeftCommandLabel action: #deactivateSelectedNode;
			add: self resetChoiceCommandLabel action: #resetChoiceForSelectedNode]
		ifFalse: [self selectedNode isActive
			ifTrue: [aMenu add: self deactivateNodeCommandLabel action: #deactivateSelectedNode]
			ifFalse: [aMenu add: self activateNodeCommandLabel action: #activateSelectedNode]].
	(self selectedNode content respondsTo: #asDiffTree) ifTrue:
		[aMenu
			add: 'Move up in load order' action: #moveUpSelectedInLoadOrder;
			add: 'Move down in load order' action: #moveDownSelectedInLoadOrder].
	aMenu addLine.
	aMenu add: 'Inspect diff' action: #inspectSelectedDiffContent.
	(editedPatch paths includes: self selectedNode title) ifTrue:
		[aMenu add: self inspectOriginalArtifactCommandLabel action: #inspectOriginalArtifactOfSelectedNode.
		aMenu add: self inspectProposedArtifactCommandLabel action: #inspectProposedArtifactOfSelectedNode].
	^ aMenu