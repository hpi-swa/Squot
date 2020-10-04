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
	self selectedNode isArtifactNode ifTrue:
		[self addUnloadedArtifactMenuItems: aMenu.
		aMenu
			add: 'Move up in load order' action: #moveUpSelectedInLoadOrder;
			add: 'Move down in load order' action: #moveDownSelectedInLoadOrder].
	aMenu addLine.
	aMenu add: 'Inspect diff (i)' action: #inspectSelectedDiffContent.
	self selectedNode content ifNotNil:
		[
		aMenu add: 'Browse full (b)' action: #browseWorkingCopyEdition.
		aMenu add: self browseOtherEditionLabel action: #browseOtherEdition.
		self addCustomMenuItemsOfSelectedNode: aMenu].
	self selectedNode isArtifactNode ifTrue:
		[aMenu add: self inspectOriginalArtifactCommandLabel action: #inspectOriginalArtifactOfSelectedNode.
		aMenu add: self inspectProposedArtifactCommandLabel action: #inspectProposedArtifactOfSelectedNode].
	^ aMenu