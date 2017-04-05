processing
unpack
	| reader |
	reader := GitZLibReadStream on: self sourceStream.
	unpackedBytes :=  reader contents.
	self assert: unpackedBytes size = unpackedLength.