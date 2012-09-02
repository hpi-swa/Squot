tests
testCompleteUsecase
	|git |
	git := workingCopy workingDirectory.

	workingCopy root children size.

	(git / 'f') writeStreamDo: [ :stream | stream nextPutAll: 'new file' ].
	self commit: 'adding files'.

	(git / 'f') delete.
	self commit: 'deleted files'.