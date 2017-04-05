public-accessing-objects
objectNamed: aHash ifAbsent: aBlock
	objectCache at: aHash ifPresent: [:it | it ifNotNil: [it hexHash = aHash ifTrue: [^ it]]].
	^ self
		looseObjectNamed: aHash
		ifAbsent: [ 
			self 
				packedObjectNamed: aHash
				ifAbsent: aBlock ]