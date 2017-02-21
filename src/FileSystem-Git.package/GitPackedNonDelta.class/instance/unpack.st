processing
unpack
	| reader |
	reader := GitZLibReadStream on: self sourceStream.
	unpackedBytes :=  reader contents