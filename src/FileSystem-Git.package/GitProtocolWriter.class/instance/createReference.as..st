commands receive-pack
createReference: referenceName as: newSignature
	^ self zeroSignature, ' ', newSignature, ' ', referenceName