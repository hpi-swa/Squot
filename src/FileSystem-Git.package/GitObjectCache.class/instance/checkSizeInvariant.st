private
checkSizeInvariant
	self assert: objectsSortedBySize size = cache size.
	self assert: totalSize = (objectsSortedBySize inject: 0 into: [:total :each | total + each key]).