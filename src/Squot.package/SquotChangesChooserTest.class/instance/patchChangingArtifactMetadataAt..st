test objects
patchChangingArtifactMetadataAt: path
	| object snapshot |
	object := ValueHolder new contents: 1; yourself.
	workingCopy add: object at: path.
	(workingCopy artifactAt: path) liveStoreInfo at: #customProperty put: 'old'.
	snapshot := workingCopy snapshot.
	(workingCopy artifactAt: path) liveStoreInfo at: #customProperty put: 'new'.
	^ workingCopy patchRelativeToBase: snapshot