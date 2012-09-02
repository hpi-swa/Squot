public-accessing-objects
objectNamed: aHash
	^ self 
		objectNamed: aHash asHexHash 
		ifAbsent: [ ]