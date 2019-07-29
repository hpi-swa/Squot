initialize-release
incomingDiff: anArtifactDiff
	self assert: base = anArtifactDiff base.
	incoming := anArtifactDiff.