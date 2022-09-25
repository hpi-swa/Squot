building
compareConsolidatedIncomingArtifact: consolidatedArtifact
	workingProjectSnapshot project artifacts at: consolidatedArtifact id
		ifPresent:
			[:workingArtifact | | merge incomingSnapshot workingSnapshot |
			incomingSnapshot := (incomingProjectSnapshot snapshotArtifact: (incomingArtifactsMapping at: consolidatedArtifact)).
			workingSnapshot := (workingProjectSnapshot snapshotArtifact: workingArtifact).
			(baseProjectSnapshot project includesArtifactWithId: consolidatedArtifact id)
				ifTrue:
					[| baseSnapshot | baseSnapshot := baseProjectSnapshot snapshotArtifact: (baseProjectSnapshot project artifacts at: consolidatedArtifact id).
					merge := SquotArtifactMerge into: workingSnapshot merge: incomingSnapshot basedOn: baseSnapshot
						willBeLoaded: true "fake"
						graphMerge: (workingSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: baseSnapshot objectSnapshot)
						metadataMerge: (workingArtifact storeInfo squotMergeWith: consolidatedArtifact storeInfo basedOn: baseSnapshot artifact storeInfo)]
				ifFalse: "Differences between working and incoming are conflicts"
					[| emptyBase | emptyBase := SquotArtifactSnapshot artifact: workingArtifact copy objectSnapshot: (SquotShadowGraph withSingleShadow: Object new captureWithSquot).
					merge := SquotArtifactMerge into: workingSnapshot merge: incomingSnapshot basedOn: emptyBase
						willBeLoaded: true "fake"
						graphMerge: (workingSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: emptyBase objectSnapshot)
						metadataMerge: (workingArtifact storeInfo squotMergeWith: consolidatedArtifact storeInfo basedOn: SquotTrackedObjectMetadata new)].
			merges add: merge]
		ifAbsent:
			[(baseProjectSnapshot project includesArtifactWithId: consolidatedArtifact id)
				ifTrue: "In the working copy the artifact was removed. If there are any differences between base and incoming, these would be lost if the artifact stays removed. So such differences are conflicting with the removal."
					[| baseArtifact baseSnapshot incomingSnapshot graphMerge storeInfoMerge |
					baseArtifact := baseProjectSnapshot project artifacts at: consolidatedArtifact id.
					baseSnapshot := baseProjectSnapshot snapshotArtifact: baseArtifact.
					storeInfoMerge := baseArtifact storeInfo squotMergeWith: consolidatedArtifact storeInfo basedOn: baseArtifact storeInfo.
					incomingSnapshot := incomingProjectSnapshot snapshotArtifact: (incomingArtifactsMapping at: consolidatedArtifact).
					graphMerge := baseSnapshot objectSnapshot squotMergeWith: incomingSnapshot objectSnapshot basedOn: baseSnapshot objectSnapshot.
					(storeInfoMerge hasChanges or: [graphMerge hasChanges])
						ifTrue: "Differences are in conflict with the removal"
							[conflicts add: (SquotContainerConflict workingDiff: (SquotArtifactRemoval of: baseArtifact) conflictingDiff: (SquotArtifactMerge into: baseSnapshot merge: incomingSnapshot basedOn: baseSnapshot willBeLoaded: true "fake" graphMerge: graphMerge metadataMerge: storeInfoMerge))]
						ifFalse: "Leave the artifact removed" []]
				ifFalse: [additions add: (SquotArtifactAddition of: consolidatedArtifact)]].