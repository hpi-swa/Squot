as yet unclassified
readFrom: aStream
	| binaryHash numberOfEntries |
	self assert: (aStream next: 4) asString = 'DIRC'. "magic number"
	version := (aStream next: 4) asInteger.
	self assert: version = 2. "do not support the others as of now"
	numberOfEntries := (aStream next: 4) asInteger.
	entries := OrderedCollection new: numberOfEntries.
	numberOfEntries timesRepeat: [self readEntryFrom: aStream].
	extensions := OrderedCollection new.
	[aStream position + 20 "160 bit sha1" >= aStream size]
		whileFalse: [self readExtensionFrom: aStream].
	binaryHash := aStream next: 20.
	self assert: aStream atEnd.