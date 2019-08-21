tests
patchWithTwoChangedArtifacts
	| artifact1 artifact2 changedArtifact1 changedArtifact2 |
	artifact1 := SquotArtifact new path: '1'; content: SquotArtifactContentMock new.
	changedArtifact1 := artifact1 copyWithDifferentContent: SquotArtifactContentMock new.
	artifact1 content
		whenComparedReturnMock;
		whenComparedWith: artifact1 content
		return: SquotDiffOfEqualObjects new;
		whenMergedReturn: (SquotMergeMock new
			hasConflicts: false;
			working: artifact1 content;
			incoming: changedArtifact1 content;
			yourself).
	artifact2 := SquotArtifact new path: '2'; content: SquotArtifactContentMock new.
	changedArtifact2 := artifact2 copyWithDifferentContent: SquotArtifactContentMock new.
	artifact2 content
		whenComparedReturnMock;
		whenComparedWith: artifact2 content
		return: SquotDiffOfEqualObjects new;
		whenMergedReturn: (SquotMergeMock new
			hasConflicts: false;
			working: artifact2 content;
			incoming: changedArtifact2 content;
			yourself).
	^ SquotMerge into: (SquotSnapshot builder add: artifact1; add: artifact2; buildSnapshot)
		merge: (SquotSnapshot builder add: changedArtifact1; add: changedArtifact2; buildSnapshot)
		basedOn: (SquotSnapshot builder add: artifact1; add: artifact2; buildSnapshot)