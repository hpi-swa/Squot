accessing
indexForObjectNamed: hexHash
	| integerHash low high bounds |
	integerHash := hexHash asIntegerHash.
	bounds := self boundsFor: hexHash.
	low := bounds first.
	high := bounds second.
	(self findBinary: integerHash from: low to: high)
		ifNil: [(NotFound object: hexHash) signal]
		ifNotNil: [:index | ^ index].