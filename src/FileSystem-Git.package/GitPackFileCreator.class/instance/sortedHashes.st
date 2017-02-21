accessing
sortedHashes
	^ sortedHashes ifNil: [ sortedHashes := self orderedHashes asSortedCollection ]