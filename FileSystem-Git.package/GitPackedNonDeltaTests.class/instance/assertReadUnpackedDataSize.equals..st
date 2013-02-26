helpers
assertReadUnpackedDataSize: aByteArray equals: expected 
	| object |
	object := GitPackedNonDelta new 
						sourceStream: aByteArray readStream;
						yourself.
	self assert: object readUnpackedDataSize equals: expected