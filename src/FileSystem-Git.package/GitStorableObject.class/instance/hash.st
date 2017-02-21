comparing
hash
	^ integerHash ifNil: [ 
		integerHash := (GitHash from: self byteSignature) hash ]