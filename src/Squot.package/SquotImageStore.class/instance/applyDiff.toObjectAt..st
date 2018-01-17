patching
applyDiff: anArtifactDiff toObjectAt: path
	| object graph objectEnvironment |
	object := objects at: path.
	graph :=
		objectGraphs
			ifNotNil: [objectGraphs at: object ifAbsentPut: [self capture: object]]
			ifNil: [self capture: object].
	objectEnvironment := (additionalInfo at: path)
		at: #environment
		ifAbsent: [environment].
	objectEnvironment beCurrentDuring: 
		[anArtifactDiff applyToLoaded: (graph ifNil: [object])].
	graph ifNotNil: [objects at: path put: graph startObject].