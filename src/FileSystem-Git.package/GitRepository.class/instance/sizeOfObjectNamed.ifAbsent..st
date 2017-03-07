public-accessing-objects
sizeOfObjectNamed: aHash ifAbsent: aBlock
	^ (self
		headerOfLooseObjectNamed: aHash
		ifAbsent: [ 
			self 
				headerOfPackedObjectNamed: aHash
				ifAbsent: aBlock ])
		objectSize