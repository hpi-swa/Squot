writing
fileOut
	collection ifNil: [^ self].
	file writeStreamDo: [:stream | STON squotPut: collection onStream: stream].