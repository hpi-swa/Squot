version-io
readAssetFrom: aStream
	^ self toPlaintext: (aStream binary; contents) utf8Decoded