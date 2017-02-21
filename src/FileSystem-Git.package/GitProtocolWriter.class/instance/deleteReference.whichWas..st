commands receive-pack
deleteReference: referenceName whichWas: oldSignature
	^ oldSignature, ' ', self zeroSignature, ' ', referenceName