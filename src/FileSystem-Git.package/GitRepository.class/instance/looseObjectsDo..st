enumerating
looseObjectsDo: aBlock
	self privateDeprecatedUseUnitOfWork.
	self flag: 'replace #objectNamed: with a message that only looks up loose objects'.
	self looseObjectNamesDo: [ :hexHash|
		aBlock value: (self objectNamed: hexHash)]