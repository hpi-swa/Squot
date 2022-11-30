commands receive-pack
deleteReference: referenceName whichWas: oldSignature
	^ oldSignature, ' ', self zeroSignature, ' ', (self encodeUtf8: referenceName)