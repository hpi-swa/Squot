tests
testUnloadedAppearInMerges
	"If artifacts are not affected by a merge, but are unloaded, they do appear, but as disabled."
	| incoming artifactSnapshot merge |
	workingCopy add: ValueHolder new at: 'object'.
	workingCopy saveVersionWithMessage: 'Add object'.
	workingCopy saveVersionWithMessage: 'Dummy incoming version'. "to force a merge"
	incoming := workingCopy baseVersion.
	"Reset to first version"
	workingCopy loadedHistorian version: workingCopy baseVersion parents first.
	workingCopy loadedVersion: workingCopy baseVersion.
	workingCopy saveVersionWithMessage: 'Dummy working version'. "to force a merge"
	"Unload the object"
	artifactSnapshot := (store artifactAt: 'object') capture.
	workingCopy removeAt: 'object'.
	workingCopy addUnloaded: artifactSnapshot.
	"when"
	merge := workingCopy newMergeOperation
		mergeVersion: incoming;
		prepare.
	"then"
	self assert: (merge includesModificationAt: 'object');
		assert: (merge modificationAt: 'object' ifAbsent: []) isLoad;
		deny: (merge modificationAt: 'object' ifAbsent: []) willBeLoaded.