initialize-release
named: aHexHash in: aRepository
	^ self 
		fromStream: (aRepository streamObjectNamed: aHexHash)
		inRepository: aRepository