combining diffs
inConflictWith: anArtifactDiff
	self assert: left = anArtifactDiff left.
	^ SquotArtifactConflict leftDiff: self rightDiff: anArtifactDiff