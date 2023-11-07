printing
printOn: aStream
	self
		printAssetTypeOn: aStream;
		space: aStream;
		printAtPathOn: aStream;
		space: aStream;
		printEncodedUsingOn: aStream.