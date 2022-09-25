accessing
artifactAt: path
	| artifact |
	artifact := workingCopy project artifactAt: path ifAbsent: [].
	artifact ifNotNil: [^ artifact].
	artifact := artifacts at: path ifAbsentPut: [workingCopy project artifacts detect: [:each | (each storeInfo at: 'path') = path] ifNone: [(KeyNotFound key: path) signal]].
	^ SquotLegacyImageStoreArtifactFake artifact: artifact workingCopy: workingCopy