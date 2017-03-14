public-accessing
header
	^ GitStorableObjectHeader
		typeCode: self typeCode
		size: self unpackedLength