accessing
byteData
	| stream |
	stream := GitStream new.
	self storeOn: stream.
	^stream contents