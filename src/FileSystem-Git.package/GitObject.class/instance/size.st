public-testing
size
	| stream |
	loadedSize ifNotNil: [^ loadedSize].
	stream := GitStream new.
	self storeOn: stream.
	^ stream size