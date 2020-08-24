tests
testHeadFile
	self assert: (repository baseDir / 'HEAD') exists.
	self assert: repository headFile exists.
	self assert: (repository baseDir allFiles select: [ : file |
		file basename = 'HEAD' ]) size = 2. "the ref itself and its reflog"
	self shouldnt: [ self unitOfWork validate ] raise: GitInvalidRepositoryError.
	
	repository headFile delete.
	self deny: repository headFile exists.
	self should: [ repository newUnitOfWork validate ] raise: GitInvalidRepositoryError
	