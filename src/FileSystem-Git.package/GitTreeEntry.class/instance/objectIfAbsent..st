public-accessing
objectIfAbsent: aBlock
	^ self currentUnitOfWork objectNamed: self entryHash ifAbsent: aBlock