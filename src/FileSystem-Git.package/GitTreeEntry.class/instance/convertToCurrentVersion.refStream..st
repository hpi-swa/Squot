objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	(mode isNil
	and: [(varDict includesKey: #mode) not
	and: [varDict includesKey: #isInFilemode]])
		ifTrue: [(varDict at: #isInFilemode)
			ifTrue: [self beInFilemode]
			ifFalse: [(varDict at: #isSubmodule ifAbsent: [false])
					ifTrue: [self beInSubmodulemode]
					ifFalse: [self beInDirectorymode]]].