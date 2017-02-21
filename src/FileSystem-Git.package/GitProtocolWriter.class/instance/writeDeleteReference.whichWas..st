commands receive-pack
writeDeleteReference: referenceName whichWas: oldSignature
	^ self
		writeCommand: oldSignature, ' ', self zeroSignature, ' ', referenceName
		withLineTerminator: true