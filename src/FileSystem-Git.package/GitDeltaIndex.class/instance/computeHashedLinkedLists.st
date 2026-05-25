computing
computeHashedLinkedLists
	| hashTable bucketCounts hasher previousValue window lastEntry |
	hashTable := Array new: self hashMask + 1.
	bucketCounts := hashTable collect: [:x | 0].
	hasher := GitDeltaRabinHasher on: self source.
	window := hasher class window.
	previousValue := -1.
	lastEntry := nil.
	1 + ((self entries - 1) * window) to: 1 by: window negated do: [:index | | value |
		value := hasher hashFirstWindowAt: index + 1.
		value = previousValue
			ifTrue: [
				lastEntry offset: index + window.
				self entries: self entries - 1]
			ifFalse: [ | entry hashIndex |
				previousValue := value.
				entry := GitDeltaIndexEntry at: index + window withHashValue: value.
				hashIndex := (value bitAnd: self hashMask) + 1.
				(hashTable at: hashIndex) ifNil: [hashTable at: hashIndex put: LinkedList new].
				(hashTable at: hashIndex) addFirst: entry.
				bucketCounts at: hashIndex put: (bucketCounts at: hashIndex) + 1]].
	self limitHashBuckets: hashTable withSizes: bucketCounts.
	^ hashTable
	