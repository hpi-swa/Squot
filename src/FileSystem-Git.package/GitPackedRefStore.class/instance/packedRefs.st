accessing
packedRefs
	^ packedRefs ifNil: [packedRefs := repository packedRefs]