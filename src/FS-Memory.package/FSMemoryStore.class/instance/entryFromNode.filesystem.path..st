private
entryFromNode: anObject filesystem: aFilesystem path: aPath
	^ FSDirectoryEntry
		filesystem: aFilesystem
		path: aPath
		creation: 0
		modification: 0
		isDir: anObject isDictionary
		size:
			(anObject isDictionary
				ifTrue: [ 0 ]
				ifFalse: [ anObject size ])