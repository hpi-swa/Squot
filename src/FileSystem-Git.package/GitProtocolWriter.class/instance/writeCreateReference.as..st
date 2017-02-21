commands receive-pack
writeCreateReference: referenceName as: newSignature
	^ self
		writeCommand: self zeroSignature, ' ', newSignature, ' ', referenceName
		withLineTerminator: true