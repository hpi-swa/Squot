test objects
patchRemovingArtifactAt: path
	| artifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	artifact content
		whenComparedWith: artifact content return: SquotDiffOfEqualObjects new.
	^ SquotMerge into: (SquotSnapshot builder add: artifact; buildSnapshot)
		merge: (SquotSnapshot empty)
		basedOn: (SquotSnapshot builder add: artifact; buildSnapshot)