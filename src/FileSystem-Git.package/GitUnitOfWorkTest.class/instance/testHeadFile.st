tests
testHeadFile
	self assert: (repository resolveRef: 'HEAD') notNil.
	self assert: (basicRepository baseDir allFiles select: [ : file |
		file basename = 'HEAD' ]) size = 1.
	self shouldnt: [ repository validate ] raise: GitInvalidRepositoryError.
	
	basicRepository headFile delete.
	repository := basicRepository newUnitOfWork.
	self assert: (repository resolveRef: 'HEAD') isNil.
	self should: [ repository validate ] raise: GitInvalidRepositoryError	
	