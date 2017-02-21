tests
testCompleteData
	| pack object compressedData |
	compressedData := #[ 11 12 13 14 ].
	pack := #[ 2r00000100 ], compressedData.
	object := GitPackedNonDelta new 
							sourceStream: pack readStream;
							startPosition: 0;
							readHeaders;
							lengthInPack: 5.
	self assert: object completeData equals: pack.