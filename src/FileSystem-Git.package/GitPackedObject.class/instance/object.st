public-accessing
object
	^ GitStorableObject 
		fromPackedObjectStream: self unpackedBytes readStream
		type: self byteTypeCode
		in: self repository