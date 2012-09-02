commit tests
testCommittingCreateAndDelete
	self assert: workingCopy root children isEmpty.
	(workingCopy / 'newFile') writeStreamDo: [ :stream | stream nextPutAll: 'some content' ].
	
	workingCopy delete: (workingCopy / 'newFile').
	
	self commit: 'commit 1'.