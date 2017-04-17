ui menus
diffTreeMenuHook: aMenu
	<menuDiffTree>
	self selectedDiffNodeIsIncluded
		ifTrue: [aMenu add: 'Exclude this change from the new version' action: #actionExcludeDiffNode]
		ifFalse: [aMenu add: 'Include this change in the new version' action: #actionIncludeDiffNode].
	aMenu add: 'Inspect diff' action: #actionInspectDiffContent.
	(diffs includesKey: self diffSelectedNode title) ifTrue:
		[aMenu add: 'Inspect original edition' action: #actionInspectOriginalArtifactFromDiff.
		aMenu add: 'Inspect proposed edition' action: #actionInspectProposedArtifactFromDiff].
	^ aMenu