writing
fileOut
	collection ifNil: [^ self].
	collection sort.
	file writeStreamDo: [:stream | STON squotPut: collection onStream: stream].