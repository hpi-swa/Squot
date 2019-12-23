patching
applyDiff: anArtifactDiff toObjectAt: path
	| object graph metadata |
	object := self objectAt: path.
	graph := self objectGraphs at: object ifAbsent: [self captureObjectGraphAt: path].
	metadata := additionalInfo at: path
		ifPresent: [:existing | existing mergeWith: anArtifactDiff right storeInfo]
		ifAbsent: [anArtifactDiff right storeInfo].
	SquotCurrentMetadata value: metadata during:
		[anArtifactDiff applyToLoaded: (graph ifNil: [object])].
	graph ifNotNil: [objects at: path put: graph startObject].