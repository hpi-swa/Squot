commit tests
testCommitting
	| revision |
	revision := workingCopy revision.
	self assert: revision isNil.
	
	(workingCopy  / 'aFile') writeStreamDo: [ :stream | ].
	self commit: 'commit 1'.
	revision := workingCopy revision.
	self withUnitOfWork: [:git |
	self assert: (workingCopy  / 'aFile') exists.
	self assert: revision isNil not.
	self assert: revision tree entries size = 1.
	self assert: (revision tree entries includesKey: 'aFile').
	
	(workingCopy  / 'file2') writeStreamDo: [ :stream | ].
	self commit: 'commit 2'.
	revision := workingCopy revision.
	self assert: (workingCopy  / 'file2') exists.
	self assert: (workingCopy / 'aFile') exists.
	self assert: revision isNil not.
	self assert: revision tree entries size = 2.
	self assert: (revision tree entries includesKey: 'aFile').
	self assert: (revision tree entries includesKey: 'file2')
	].