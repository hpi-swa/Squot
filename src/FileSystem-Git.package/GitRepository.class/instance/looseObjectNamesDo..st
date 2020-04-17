enumerating
looseObjectNamesDo: aBlock 
	self privateDeprecatedUseUnitOfWork.
	self objectDirectoriesDo: [ :dirReference | 
		dirReference files do: [ :fileReference | | hash |
			hash := dirReference basename , fileReference basename.
			aBlock value: hash ] ]