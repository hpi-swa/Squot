public-accessing-objects
objectNamed: aHash ifAbsent: aBlock
	^ self
		looseObjectNamed: aHash
		ifAbsent: [ 
			self 
				packedObjectNamed: aHash
				ifAbsent: aBlock ]