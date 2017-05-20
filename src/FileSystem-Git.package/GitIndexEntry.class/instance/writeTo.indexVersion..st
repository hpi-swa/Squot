as yet unclassified
writeTo: aStream indexVersion: versionNumber
	| startPosition shortNameLength |
	startPosition := aStream position.
	aStream
		nextInt32Put: ctime asUnixTime;
		nextInt32Put: ctime nanoSecond;
		nextInt32Put: mtime asUnixTime;
		nextInt32Put: mtime nanoSecond;
		nextInt32Put: device;
		nextInt32Put: inode;
		nextInt32Put: mode;
		nextInt32Put: uid;
		nextInt32Put: gid;
		nextInt32Put: size.
	self assert: objectHash size = 20.
	aStream nextPutAll: objectHash.
	self assert: flags size = 2.
	aStream nextPutAll: flags.
	shortNameLength := flags second bitOr: ((flags first bitAnd: 2r00001111) bitShift: 8).
	path size > 16rFFE
		ifTrue: [self assert: 16rFFF = shortNameLength]
		ifFalse: [self assert: shortNameLength = path size].
	versionNumber >= 3 ifTrue: [self notYetImplemented. "moreFlags"].
	versionNumber >= 4 ifTrue: [self notYetImplemented. "prefix compressed path"].
	aStream
		nextPutAll: path.
	8 - (aStream position - startPosition rem: 8) timesRepeat: [aStream nextPut: 0].