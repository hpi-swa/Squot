public-accessing-objects
headerOfObjectNamed: aHash ifAbsent: aBlock
	self privateDeprecatedUseUnitOfWork.
	^ self
		headerOfLooseObjectNamed: aHash
		ifAbsent: [ 
			self 
				headerOfPackedObjectNamed: aHash
				ifAbsent: aBlock ]