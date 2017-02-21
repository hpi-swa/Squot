tests
testCompleteUsecase2
	|git |
	git := workingCopy workingDirectory.
	
	(git / 'f') writeStreamDo: [ :stream | stream nextPutAll: 'new file' ].
	self commit: 'adding files'.

	(git / 'f') delete.
	self commit: 'deleted files'.