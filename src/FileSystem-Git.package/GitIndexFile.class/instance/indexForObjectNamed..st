accessing
indexForObjectNamed: hexHash
	| integerHash index low high test bounds |
	integerHash := hexHash asIntegerHash.
	bounds := self boundsFor: hexHash.
	low := bounds first.
	high := bounds second.
	^ self findBinary: integerHash from: low to: high