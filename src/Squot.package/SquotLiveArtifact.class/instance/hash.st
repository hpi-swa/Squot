comparing
hash
	^ ((object hash hashMultiply
		bitXor: path hash) hashMultiply
		bitXor: storeInfo hash) hashMultiply
		bitXor: store hash