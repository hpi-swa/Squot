Pur historian
version: aVersion
	self file writeStreamDo:
		[:stream |
		stream nextPutAll: aVersion internalId].