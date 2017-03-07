public-accessing
headerOfObjectAtOffset: offset 
	^ GitPackedObject
		headerFromPack: self
		at: offset
		in: self repository