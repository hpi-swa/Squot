accessing
at: aHash ifAbsentPut: aBlock
	| object isNew size sizeAndObject |
	isNew := false.
	object := cache at: aHash ifAbsentPut: [isNew := true. aBlock value].
	(isNew and: [GitFeatureFlags evictFromObjectCache]) ifFalse: [^ object].
	size := object size.
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
		cache removeKey: sizeAndObject value hexHash.
		totalSize := totalSize - sizeAndObject key].
	"self assert: objectsSortedBySize size = cache size.
	self assert: totalSize = (objectsSortedBySize inject: 0 into: [:total :each | total + each key])."
	^ object