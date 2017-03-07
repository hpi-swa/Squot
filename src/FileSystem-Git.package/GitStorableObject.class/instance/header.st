accessing
header
	^ GitStorableObjectHeader
		typeCode: self typeCode
		size: self size