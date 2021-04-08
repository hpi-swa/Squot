comparing
hash
	^ proxy constructorArgs hash hashMultiply bitXor:
		(proxy constructorSelector hash hashMultiply bitXor:
		(proxy globalObjectName hash hashMultiply bitXor:
		proxy preSelector hash))