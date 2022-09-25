accessing
artifactAt: path
	| artifact |
	(workingCopy project includesArtifactWithId: path) ifTrue: [^ workingCopy project artifactAt: path "actually id"].
	artifact := workingCopy project artifacts detect: [:each | each path = path] ifNone: [(KeyNotFound key: path) signal].
	^ (SquotLegacyArtifactAdapter
		artifact: artifact
		objectSnapshot: ((workingCopy storeForArtifact: artifact) readArtifact: artifact) objectSnapshot)
		workingCopy: self;
		yourself