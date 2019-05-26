testing
testReadWriteReadRoundtrip
	| refs peeledRefs |
	refs := packedRefs refs.
	peeledRefs := packedRefs peeledRefs.
	packedRefs writeToFile; readFromFile.
	self assert: refs equals: packedRefs refs description: 'Refs changed after write';
		assert: peeledRefs equals: packedRefs peeledRefs description: 'Peeled refs changed after write'.