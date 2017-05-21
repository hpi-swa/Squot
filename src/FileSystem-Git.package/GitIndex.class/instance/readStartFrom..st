as yet unclassified
readStartFrom: aStream
	self assert: (aStream next: 4) asString = 'DIRC'. "magic number"
	version := (aStream next: 4) asInteger.
	self assert: version = 2. "do not support the others as of now"
	numberOfEntries := (aStream next: 4) asInteger.