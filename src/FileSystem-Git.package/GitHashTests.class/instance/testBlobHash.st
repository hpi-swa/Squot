tests
testBlobHash
	| bytes hash blob dataSize |
	bytes := #[1 2 3].
	hash := #[174 210 151 62 75 138 127 241 179 
		15 245 196 117 30 90 43 56 152 158 116].
	blob := GitBlob bytes: bytes in: nil.
	dataSize := 
		blob typeCode size +
		1 + "space"
		bytes size asString size +
		1 + "null byte"
		bytes size.
	self assert: blob byteSignature size = dataSize.
	self assert: blob hash asByteHash =  hash.
	self assert: blob hash size = 20.
	self assert: (GitBlob bytes: bytes in: nil) hash = blob hash