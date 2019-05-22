accessing
parents: aCollection
	self directory ensureDirectory / 'parents' writeStreamDo:
		[:stream |
		aCollection do:
			[:each | stream nextPutAll: each internalId; cr]].