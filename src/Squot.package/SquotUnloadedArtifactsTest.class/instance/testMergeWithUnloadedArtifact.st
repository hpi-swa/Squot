tests
testMergeWithUnloadedArtifact
	"Regression test: load status of the resolvedPatch of the artifact must be initialized."
	| incoming artifactSnapshot merge |
	workingCopy add: ValueHolder new at: 'object'.
	workingCopy saveVersionWithMessage: 'Add object'.
	(workingCopy objectAt: 'object') contents: 1.
	workingCopy saveVersionWithMessage: 'Change object'.
	incoming := workingCopy baseVersion.
	"Reset to first version"
	workingCopy loadedHistorian version: workingCopy baseVersion parents first.
	workingCopy loadedVersion: workingCopy baseVersion.
	(workingCopy objectAt: 'object') contents: nil.
	workingCopy saveVersionWithMessage: 'Dummy working version'. "to force a merge"
	"Unload the object"
	artifactSnapshot := (store artifactAt: 'object') capture.
	workingCopy removeAt: 'object'.
	workingCopy addUnloaded: artifactSnapshot.
	"when"
	merge := workingCopy newMergeOperation
		mergeVersion: incoming;
		prepare;
		yourself.
	"then"
	self shouldnt: [merge applyToWorkingCopy] raise: Error.
	SquotToggles useNewApi 
		ifTrue:
			[| snapshot |
			snapshot := (workingCopy storeForArtifact: artifactSnapshot artifact) readArtifact: artifactSnapshot artifact.
			(workingCopy storeForArtifact: snapshot artifact) removeArtifact: snapshot artifact.
			workingCopy useStoreImplementation: SquotValueHolderStore forArtifact: snapshot artifact.
			(workingCopy storeForArtifact: snapshot artifact) putArtifact: snapshot]
		ifFalse: [(workingCopy artifactAt: 'object') load].
	self assert: 1 equals: (workingCopy objectAt: 'object') contents.