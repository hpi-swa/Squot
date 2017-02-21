commands receive-pack
updateReference: referenceName from: oldSignature to: newSignature
	^ oldSignature, ' ', newSignature, ' ', referenceName