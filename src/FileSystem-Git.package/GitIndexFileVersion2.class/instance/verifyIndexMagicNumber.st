verifying
verifyIndexMagicNumber
	(fullStream next: 4) = self indexMagicNumber ifTrue: [ ^ self ]. 
	
	GitInvalidIndexFileError signal: 'Bad magic number. ',
	'Either this index file is corrupt or it is not a version 2 index.'