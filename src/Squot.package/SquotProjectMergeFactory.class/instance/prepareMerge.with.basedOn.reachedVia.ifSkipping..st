callbacks for objects
prepareMerge: workingObjectReflection with: incomingObjectReflection basedOn: baseObjectReflection reachedVia: anObject ifSkipping: skipBlock
	"Project merges spawn artifact merging here."
	| workingArtifact incomingArtifact merge incomingSnapshot workingSnapshot |
	workingArtifact := workingObjectReflection object.
	workingArtifact == workingProjectSnapshot ifTrue: [^ self]. "Only prepare anything for artifact merges."
	incomingArtifact := incomingObjectReflection object.
	incomingSnapshot := (incomingProjectSnapshot snapshotArtifact: incomingArtifact).
	workingSnapshot := (workingProjectSnapshot snapshotArtifact: workingArtifact).
	baseObjectReflection object
		ifNotNil:
			[| baseSnapshot | baseSnapshot := baseProjectSnapshot snapshotArtifact: baseObjectReflection object.
			merge := SquotArtifactMerge into: workingSnapshot merge: incomingSnapshot basedOn: baseSnapshot
				willBeLoaded: true "fake"
				graphMerge: (workingSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: baseSnapshot objectSnapshot)
				metadataMerge: (workingArtifact storeInfo squotMergeWith: incomingArtifact storeInfo basedOn: baseSnapshot artifact storeInfo)]
		ifNil: "Differences between working and incoming are conflicts"
			[| emptyBase | emptyBase := SquotArtifactSnapshot artifact: workingArtifact copy objectSnapshot: (SquotShadowGraph withSingleShadow: Object new captureWithSquot).
			merge := SquotArtifactMerge into: workingSnapshot merge: incomingSnapshot basedOn: emptyBase
				willBeLoaded: true "fake"
				graphMerge: (workingSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: emptyBase objectSnapshot)
				metadataMerge: (workingArtifact storeInfo squotMergeWith: incomingArtifact storeInfo basedOn: SquotTrackedObjectMetadata new)].
	merges add: merge.
	^ skipBlock value "Do not walk into the artifacts or metadata further"