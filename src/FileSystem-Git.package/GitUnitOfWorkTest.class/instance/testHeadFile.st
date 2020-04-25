tests
testHeadFile
	self assert: (self unitOfWork resolveRef: 'HEAD') notNil.
	self assert: (repository baseDir allFiles select: [ : file |
		file basename = 'HEAD' ]) size = 2. "the ref itself and its reflog"
	self shouldnt: [ self unitOfWork validate ] raise: GitInvalidRepositoryError.
	
	repository headFile delete.
	repository newUnitOfWork activateDuring:
		[self assert: (self unitOfWork resolveRef: 'HEAD') isNil.
		self should: [ self unitOfWork validate ] raise: GitInvalidRepositoryError]
	