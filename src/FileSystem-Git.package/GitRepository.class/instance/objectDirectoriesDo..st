enumerating
objectDirectoriesDo: aBlock
	| root regex |
	self privateDeprecatedUseUnitOfWork.
	root := self baseDir resolve: 'objects'.
	root exists ifFalse: [ GitInvalidRepositoryError signal: 'This repository has not been initialized.' ].
	regex := '[a-f0-9][a-f0-9]' asRegex.
	root directories 
		select: [ :dirReference | regex matches: dirReference basename ]
		thenDo: aBlock