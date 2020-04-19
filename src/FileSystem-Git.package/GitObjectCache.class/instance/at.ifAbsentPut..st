accessing
at: aHash ifAbsentPut: aBlock
	| object size sizeAndObject |
	object := cache at: aHash ifAbsentPut: aBlock.
	GitFeatureFlags evictFromObjectCache ifFalse: [^ object].
	size := object size.
	totalSize := totalSize + size.
	self sizeHeap add: size -> object.
	totalSize > self thresholdSize ifTrue:
		[sizeAndObject := self sizeHeap removeFirst.
		sizeAndObject value == object ifTrue:
			"don't remove the new object"
			[self sizeHeap notEmpty
				ifTrue: [	sizeAndObject := self sizeHeap removeFirst]
				ifFalse: ["put it back" self sizeHeap add: sizeAndObject. ^ object]].
		cache removeKey: sizeAndObject value hexHash.
		totalSize := totalSize - sizeAndObject key].
	^ object