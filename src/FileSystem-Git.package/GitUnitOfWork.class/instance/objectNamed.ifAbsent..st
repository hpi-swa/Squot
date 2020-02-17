accessing
objectNamed: aHash ifAbsent: aBlock
	^ [self objectNamed: aHash]
		on: GitObjectNotFoundError do:
			[:e | e return: aBlock value]