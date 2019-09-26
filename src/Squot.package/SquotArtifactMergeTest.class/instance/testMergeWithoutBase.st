tests
testMergeWithoutBase
	| a b conflictedObject merge objectMerge |
	conflictedObject := Object new.
	a := SquotArtifact new path: 'p'; content: SquotArtifactContentMock new.
	b := a copy content: SquotArtifactContentMock new.
	a content nameOf: conflictedObject is: UUID new.
	b content nameOf: conflictedObject is: (a content nameOf: conflictedObject).
	a content whenComparedWith: b content return:
		[SquotObjectGraphDiff new
			addDiff: (SquotObjectDiffMock new
						conflicts: (objectMerge :=
									SquotObjectMergeMock new
										hasConflicts: true;
										object: conflictedObject))
			forObjectNamed: (a content nameOf: conflictedObject);
			yourself].
	"when"
	merge := a mergeWithoutBaseWith: b.
	"then"
	self assert: merge hasConflicts;
		assert: (merge elementMerges includes: objectMerge).