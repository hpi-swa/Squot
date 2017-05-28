comparing
hash
	^ ((self content hash bitXor: path hash) hashMultiply bitXor: self storeInfo hash) hashMultiply