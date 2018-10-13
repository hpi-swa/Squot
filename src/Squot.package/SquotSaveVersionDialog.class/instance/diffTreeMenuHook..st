ui menus
diffTreeMenuHook: aMenu
	<menuDiffTree>
	self diffSelectedNode ifNotNil:
		[self selectedDiffNodeIsIncluded
			ifTrue: [aMenu add: 'Exclude this change from the new version' action: #deactivateSelectedNode]
			ifFalse: [aMenu add: 'Include this change in the new version' action: #activateSelectedNode].
		aMenu add: 'Inspect diff' action: #actionInspectDiffContent.
		(editedPatch paths includes: self diffSelectedNode title) ifTrue:
			[aMenu add: 'Inspect original edition' action: #actionInspectOriginalArtifactFromDiff.
			aMenu add: 'Inspect proposed edition' action: #actionInspectProposedArtifactFromDiff]].
	^ aMenu