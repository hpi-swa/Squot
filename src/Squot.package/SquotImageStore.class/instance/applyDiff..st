patching
applyDiff: anArtifactDiff
	| object objectEnvironment |
	object := objects at: anArtifactDiff path.
	objectEnvironment := (additionalInfo at: anArtifactDiff path)
		at: #environment
		ifAbsent: [environment].
	objectEnvironment beCurrentDuring: 
		[anArtifactDiff applyToLoaded: object].