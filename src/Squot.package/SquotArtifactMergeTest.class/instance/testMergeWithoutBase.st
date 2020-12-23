tests
testMergeWithoutBase
	| a b conflictedObject merge |
	conflictedObject := Object new.
	a := SquotArtifact new path: 'p'; content: SquotArtifactContentMock new.
	b := a copy content: SquotArtifactContentMock new.
	a content whenMergedReturn: SquotMergeMock new.
	"when"
	merge := a mergeWithoutBaseWith: b.
	"then"
	self assert: merge hasConflicts.