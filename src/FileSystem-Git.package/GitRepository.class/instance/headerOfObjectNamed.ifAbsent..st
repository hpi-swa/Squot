public-accessing-objects
headerOfObjectNamed: aHash ifAbsent: aBlock
	^ self
		headerOfLooseObjectNamed: aHash
		ifAbsent: [ 
			self 
				headerOfPackedObjectNamed: aHash
				ifAbsent: aBlock ]