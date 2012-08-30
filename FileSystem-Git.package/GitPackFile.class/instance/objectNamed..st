public-accessing
objectNamed: hexHash
	^ self objectAtOffset: (indexFile offsetForObjectNamed: hexHash)