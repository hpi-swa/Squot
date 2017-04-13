comparing
hash
	^ (self repository hash hashMultiply bitXor: self expandedName hash) hashMultiply