sar
serializeVersion: anObject
	| stream |
	stream := RWBinaryOrTextStream on: ''.
	self writeVersion: anObject on: stream.
	^ stream contents