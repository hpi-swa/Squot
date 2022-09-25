initialize-release
incomingDiff: anArtifactDiff
	SquotToggles useNewApi ifFalse: [self assert: base = anArtifactDiff base].
	incoming := anArtifactDiff.