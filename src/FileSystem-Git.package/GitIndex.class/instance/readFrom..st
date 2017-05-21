reading
readFrom: aStream
	| binaryHash |
	self readStartFrom: aStream.
	entries := OrderedCollection new: numberOfEntries.
	numberOfEntries timesRepeat: [self readEntryFrom: aStream].
	extensions := OrderedCollection new.
	[aStream position + 20 "160 bit sha1" >= aStream size]
		whileFalse: [self readExtensionFrom: aStream].
	binaryHash := aStream next: 20.
	self assert: aStream atEnd.
	self assert: binaryHash = (GitHash from: (aStream contents allButLast: 20)) byteHash.