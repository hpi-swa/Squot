public-accessing
objectAtOffset: offset 
	^ GitPackedObject
		fromPack: self
		at: offset
		in: self repository