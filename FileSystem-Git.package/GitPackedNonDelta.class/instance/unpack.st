processing
unpack
	| reader |
	reader := (ZLibReadStream on: file).
	unpackedBytes :=  reader contents.
	packedLength := packedLength + reader sourcePosition