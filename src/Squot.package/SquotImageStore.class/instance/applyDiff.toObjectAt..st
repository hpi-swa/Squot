patching
applyDiff: anArtifactDiff toObjectAt: path
	| object graph objectEnvironment |
	object := self objectAt: path.
	graph := self objectGraphs at: object ifAbsent: [self captureObjectGraphAt: path].
	objectEnvironment := (additionalInfo at: path)
		at: #environment
		ifAbsent: [environment].
	objectEnvironment beCurrentDuring: 
		[anArtifactDiff applyToLoaded: (graph ifNil: [object])].
	graph ifNotNil: [objects at: path put: graph startObject].