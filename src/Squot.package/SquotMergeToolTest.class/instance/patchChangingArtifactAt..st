test objects
patchChangingArtifactAt: path
	| artifact incoming |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	workingCopy add: (ValueHolder new contents: 2; yourself) at: path.
	incoming := workingCopy snapshot.
	(workingCopy objectAt: path) contents: 1.
	^ SquotMerge into: workingCopy
		merge: incoming
		basedOn: workingCopy lazySnapshot