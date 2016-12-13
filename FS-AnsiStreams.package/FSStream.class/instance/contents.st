public
contents
	| size contents |
	size := handle size.
	contents := (isBinary ifTrue: ByteArray ifFalse: ByteString) new: size.
	handle at: 1 read: contents startingAt: 1 count: size.
	^ isBinary
		ifTrue: [contents]
		ifFalse: [self converter decodeString: contents]