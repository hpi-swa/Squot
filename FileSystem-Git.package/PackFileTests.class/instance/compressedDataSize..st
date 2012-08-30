helpers
compressedDataSize: aByteArray
	| zlibReader |
	zlibReader := ZLibReadStream on: aByteArray.
	^ zlibReader 
		contents;
		sourcePosition