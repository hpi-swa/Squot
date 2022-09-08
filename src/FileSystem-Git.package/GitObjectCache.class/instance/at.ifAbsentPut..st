accessing
at: aHash ifAbsentPut: aBlock
	| object isNew size sizeAndObject |
	isNew := false.
	object := cache at: aHash ifAbsentPut: [isNew := true. aBlock value].
	isNew ifTrue: [self miss] ifFalse: [self hit].
	(isNew and: [GitFeatureFlags evictFromObjectCache]) ifFalse: [^ object].
	object typeCode = 'commit'
		ifTrue:
			[self commitsHeap add: {DateAndTime now asUnixTime. object}.
			commitsSortedByLastAccess size > 100
				ifTrue:
					[| commit | commit := commitsSortedByLastAccess removeFirst second.
					cache removeKey: commit hexHash ifAbsent: []]]
		ifFalse:
			[size := object size.
			totalSize := totalSize + size.
			self sizeHeap add: size -> object.
			totalSize > self thresholdSize ifTrue:
				[sizeAndObject := self sizeHeap removeFirst.
				sizeAndObject value == object ifTrue:
					"don't remove the new object"
					[self sizeHeap notEmpty
						ifTrue: "put it back and remove another"
							[| new |
							new := sizeAndObject.
							sizeAndObject := self sizeHeap removeFirst.
							self sizeHeap add: new]
						ifFalse: "just put it back and don't remove anything"
							[self sizeHeap add: sizeAndObject.
							^ object]].
				cache removeKey: sizeAndObject value hexHash ifAbsent: [].
				totalSize := totalSize - sizeAndObject key.
				evictions := evictions + 1].
			"self checkSizeInvariant."].
	^ object