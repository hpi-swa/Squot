unloaded objects
toggleWhetherToLoad: anArtifactMerge
	anArtifactMerge metadata containerModifications at: {SquotDictionaryEntry key: 'load'} put: (SquotReferenceAddition to: anArtifactMerge metadata working reference: (SquotDictionaryEntry key: 'load') target: (workingCopy storeImplementationForArtifact: anArtifactMerge result artifact ifNone: [self error: 'No suitable store']) rightOwner: anArtifactMerge metadata incoming).
	[((workingCopy storeForArtifact: anArtifactMerge object artifact) isMemberOf: SquotSnapshotStore)
		ifTrue:
			[| impl |
			impl := workingCopy storeImplementationForArtifact: anArtifactMerge object artifact ifNone: [self error: 'No suitable store'].
			workingCopy useStoreImplementation: impl forArtifact: anArtifactMerge object artifact]
		ifFalse: [workingCopy useStoreImplementation: SquotSnapshotStore forArtifact: anArtifactMerge object artifact]].