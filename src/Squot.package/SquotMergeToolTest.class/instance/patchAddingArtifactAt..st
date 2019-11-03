test objects
patchAddingArtifactAt: path
	| artifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	^ SquotMerge into: SquotSnapshot empty
		merge: (SquotSnapshot builder add: artifact; buildSnapshot)
		basedOn: SquotSnapshot empty