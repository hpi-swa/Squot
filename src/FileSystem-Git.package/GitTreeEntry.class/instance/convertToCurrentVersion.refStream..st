objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	(mode isNil
	and: [(varDict includesKey: #mode) not
	and: [varDict includesKey: #isInFilemode]])
		ifTrue: [(varDict at: #isInFilemode)
			ifTrue: [self beInFileMode]
			ifFalse: [(varDict at: #isSubmodule ifAbsent: [false])
					ifTrue: [self beInSubmoduleMode]
					ifFalse: [self beInDirectoryMode]]].