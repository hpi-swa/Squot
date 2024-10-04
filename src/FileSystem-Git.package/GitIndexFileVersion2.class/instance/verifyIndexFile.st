verifying
verifyIndexFile
	self readStreamDo: [:stream | (stream next: 8) = self class version2Header ifTrue: [^ self]].
	GitInvalidIndexFileError signal: 'Bad magic number or version. ',
		'Either this index file is corrupt or it is not a version 2 index.'