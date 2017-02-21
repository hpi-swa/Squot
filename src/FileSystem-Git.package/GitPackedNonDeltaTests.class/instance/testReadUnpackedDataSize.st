tests
testReadUnpackedDataSize
	self assertReadUnpackedDataSize: #[2r00001111] equals: 15.
	self assertReadUnpackedDataSize: #[2r00001010] equals: 10.
	"least significant appears first"
	self
		assertReadUnpackedDataSize: #[2r10001111 2r01001001]
		equals:                        2r10010010000 + 2r1111.
	self assertReadUnpackedDataSize: #[2r10001111 2r11001001 2r01000001]
		equals: 2r100000100000000000 + 2r10010010000 + 2r1111.