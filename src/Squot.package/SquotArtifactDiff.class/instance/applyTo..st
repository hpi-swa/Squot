patching
applyTo: aSnapshotContent
	self assert: (aSnapshotContent squotDiffAgainst: left content) squotHasChanges not.
	^ right content