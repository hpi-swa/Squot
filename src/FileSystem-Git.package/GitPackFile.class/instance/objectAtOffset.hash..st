accessing
objectAtOffset: offset hash: aHash
	^ GitPackedObject
		fromPack: self
		at: offset
		in: self repository
		hash: aHash