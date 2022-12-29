callbacks for objects
disappeared: incomingObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"In the working copy the artifact was removed. If there are any differences between base and incoming, these would be lost if the artifact stays removed. So such differences are conflicting with the removal."
	| disappearedArtifact baseArtifact baseSnapshot incomingSnapshot graphMerge storeInfoMerge |
	disappearedArtifact := incomingObjectReflection object.
	baseArtifact := baseProjectSnapshot project artifacts at: disappearedArtifact id.
	baseSnapshot := baseProjectSnapshot snapshotArtifact: baseArtifact.
	storeInfoMerge := baseArtifact storeInfo squotMergeWith: disappearedArtifact storeInfo basedOn: baseArtifact storeInfo.
	incomingSnapshot := incomingProjectSnapshot snapshotArtifact: disappearedArtifact.
	graphMerge := baseSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: baseSnapshot objectSnapshot.
	(storeInfoMerge hasChanges or: [graphMerge hasChanges])
		ifTrue: "Differences are in conflict with the removal"
			[conflicts add: (SquotContainerConflict workingDiff: (SquotArtifactRemoval of: baseArtifact) conflictingDiff: (SquotArtifactMerge into: baseSnapshot merge: incomingSnapshot basedOn: baseSnapshot willBeLoaded: true "fake" graphMerge: graphMerge metadataMerge: storeInfoMerge))]
		ifFalse: "Leave the artifact removed" [].
	^ skipBlock value "Do not walk into the artifacts or metadata further"