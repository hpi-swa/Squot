comparing
hash
	^ integerHash ifNil: [ 
		integerHash := (SecureHashAlgorithm new hashMessage: self byteSignature) ]