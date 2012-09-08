accessing
typeCode
	^ (GitStorableObject decodeClassFrom: self byteTypeCode) typeCode