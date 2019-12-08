tests
testRemovalsResolvedAutomatically
	"When an artifact is removed in both versions, there should be no load order conflict."
	| workingCopy merge |
	workingCopy := SquotWorkingCopy forTestInMemory.
	"when"
	merge := SquotMerge into: workingCopy
		merge: 	SquotSnapshot empty
		basedOn: (SquotSnapshot builder
					add: (SquotArtifactMock new path: 'a');
					buildSnapshot).
	"then"
	self deny: merge hasConflicts.