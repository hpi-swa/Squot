enumerating
hashesWithObjectsDo: binaryBlock
	cache keysAndValuesDo: [:hash :object | binaryBlock value: hash value: object].