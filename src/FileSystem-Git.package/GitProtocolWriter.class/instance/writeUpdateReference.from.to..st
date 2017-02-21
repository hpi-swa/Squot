commands receive-pack
writeUpdateReference: referenceName from: oldSignature to: newSignature
	^ self
		writeCommand: oldSignature, ' ', newSignature, ' ', referenceName
		withLineTerminator: true