test objects
patchChangingArtifactAt: path
	| artifact changedArtifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	changedArtifact := artifact copyWithDifferentContent: SquotArtifactContentMock new.
	artifact content
		whenComparedReturnMock;
		whenComparedWith: artifact content
		return: SquotDiffOfEqualObjects new;
		whenMergedReturn: (SquotMergeMock new
			hasConflicts: false;
			working: artifact content;
			incoming: changedArtifact content;
			yourself).
	^ SquotMerge into: (SquotSnapshot builder add: artifact; buildSnapshot)
		merge: (SquotSnapshot builder add: changedArtifact; buildSnapshot)
		basedOn: (SquotSnapshot builder add: artifact; buildSnapshot)