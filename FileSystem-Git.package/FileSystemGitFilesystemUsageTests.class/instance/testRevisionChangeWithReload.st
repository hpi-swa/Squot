commit tests
testRevisionChangeWithReload
	| oldRevision newRevision |
	oldRevision := workingCopy revision.
	self assert: oldRevision isNil.
	
	(workingCopy / 'afile') writeStreamDo: [ :stream | ].
	self commit: 'a commit'.
	oldRevision := workingCopy revision.
	self deny: workingCopy revision isNil.
	
	(workingCopy / 'anotherfile') writeStreamDo: [ :stream | ].
	self commit: 'commit 2'.
	newRevision  := workingCopy revision.
	self deny: oldRevision = workingCopy revision.
	self assert: (newRevision parents includes: oldRevision)