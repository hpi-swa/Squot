patching
mergeWith: anArtifactDiff
	self assert: self left == anArtifactDiff left.
	^ self right mergeDiffWith: anArtifactDiff right basedOn: self left