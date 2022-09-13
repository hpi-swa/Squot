utilities
writeStreamFor: filePath in: aDirectory do: aBlock
    (aDirectory resolveString: filePath) writeStreamDo:
	[:stream |
	stream truncate: 0.
	aBlock value: stream]