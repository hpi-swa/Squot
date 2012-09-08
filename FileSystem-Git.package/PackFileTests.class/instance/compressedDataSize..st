helpers
compressedDataSize: aByteArray
	| zlibReader |
	zlibReader := GitZLibReadStream on: aByteArray.
	^ zlibReader 
		contents;
		sourcePosition