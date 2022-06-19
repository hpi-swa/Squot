test objects
patchChangingArtifactMetadataAt: path
	| incoming |
	workingCopy add: (ValueHolder new contents: 2; yourself) at: path.
	(workingCopy artifactAt: path) liveStoreInfo at: #customProperty put: 'new'.
	incoming := workingCopy snapshot.
	(workingCopy artifactAt: path) liveStoreInfo at: #customProperty put: 'old'.
	^ SquotMerge into: workingCopy
		merge: incoming
		basedOn: workingCopy lazySnapshot