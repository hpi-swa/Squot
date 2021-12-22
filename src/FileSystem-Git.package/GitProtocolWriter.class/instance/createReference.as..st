commands receive-pack
createReference: referenceName as: newSignature
	^ self zeroSignature, ' ', newSignature, ' ', (self encodeUtf8: referenceName)