callbacks
conflictingAdded: workingTargetReflection and: incomingTargetReflection at: pathCollection
	"Differences between working and incoming are conflicts"
	| workingArtifact incomingArtifact merge incomingSnapshot workingSnapshot base |
	workingArtifact := workingTargetReflection object.
	incomingArtifact := incomingTargetReflection object.
	incomingSnapshot := incomingProjectSnapshot snapshotArtifact: incomingArtifact.
	workingSnapshot := workingProjectSnapshot snapshotArtifact: workingArtifact.
	((base := baseProjectSnapshot artifacts detect: [:each | each path = incomingArtifact path] ifNone: []) notNil and: [base id isNil])
		ifTrue: "Assume that two working copies independently were upgraded with artifact ids. Merge the two artifacts even though they have distinct ids."
			[self isThisEverCalled.
			merge := SquotArtifactMerge into: workingSnapshot merge: incomingSnapshot basedOn: base
				willBeLoaded: true "fake"
				graphMerge: (workingSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: base objectSnapshot)
				metadataMerge: (workingArtifact storeInfo squotMergeWith: incomingArtifact storeInfo basedOn: SquotTrackedObjectMetadata new).
			merges add: merge]
		ifFalse: "Really an addition conflict."
			[conflicts add: (SquotObjectAdditionConflict working: (workingProjectSnapshot snapshotArtifact: workingTargetReflection object) incoming: (incomingProjectSnapshot snapshotArtifact: incomingTargetReflection object))].