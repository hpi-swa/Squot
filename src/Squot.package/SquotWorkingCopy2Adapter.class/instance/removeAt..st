adding and removing
removeAt: pathString
	| artifact |
	(pathString isMemberOf: UUID)
		ifTrue: [artifact := workingCopy project artifactAt: pathString.
				workingCopy project removeArtifactAt: pathString.
				fakeStore artifacts removeKey: artifact path ifAbsent: [].
				^ artifact].
	artifact := workingCopy project artifacts detect: [:each | (each storeInfo at: 'path') = pathString] ifNone: [].
	artifact ifNil: [^ nil].
	workingCopy project removeArtifactAt: artifact id.
	^ artifact