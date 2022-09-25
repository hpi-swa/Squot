initialize-release
workingDiff: anArtifactDiff
	SquotToggles useNewApi ifFalse: [base := anArtifactDiff left].
	working := anArtifactDiff.