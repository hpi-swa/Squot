comparing
hash
	^ ((content hash bitXor: path hash) hashMultiply bitXor: storeInfo hash) hashMultiply