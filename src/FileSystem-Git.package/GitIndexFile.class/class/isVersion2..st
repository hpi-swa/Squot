testing
isVersion2: aStream
	^ (aStream reset; binary; next: 8) = self version2Header