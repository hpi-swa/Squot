tests
testHeadFile
	self assert: (repository baseDir / 'HEAD') exists.
	self assert: repository headFile exists.
	self assert: (repository baseDir allFiles select: [ : file |
		file basename = 'HEAD' ]) size = 1.
	self shouldnt: [ repository validate ] raise: GitInvalidRepositoryError.
	
	repository headFile delete.
	self deny: repository headFile exists.
	self should: [ repository validate ] raise: GitInvalidRepositoryError	
	