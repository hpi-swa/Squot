printing
printWithoutPathOn: aStream
	self
		printAssetTypeOn: aStream;
		space: aStream;
		printEncodedUsingOn: aStream.