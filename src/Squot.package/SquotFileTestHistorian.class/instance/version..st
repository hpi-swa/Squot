Pur historian
version: aVersion
	aVersion ifNil: [^ self delete].
	self file writeStreamDo:
		[:stream |
		stream nextPutAll: aVersion internalId].