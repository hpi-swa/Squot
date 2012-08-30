public-testing
size
	| stream |
	stream := GitStream new.
	self storeOn: stream.
	^ stream size