combining diffs
inConflictWith: anArtifactDiff
	self assert: left = anArtifactDiff left.
	^ SquotContainerConflict workingDiff: self conflictingDiff: anArtifactDiff