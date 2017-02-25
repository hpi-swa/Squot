private
nodeAt: aPath ifPresent: presentBlock ifAbsent: absentBlock
	| encodedPath encodedBasename entry |
	aPath isRoot ifTrue: [^ presentBlock value: self rootNode].
	
	encodedPath := Primitives encode: (self stringFromPath: aPath parent).
	encodedBasename := Primitives encode: aPath basename.
	entry := Primitives lookupDirectory: encodedPath filename: encodedBasename.
	
	^ (entry == #badDirectoryPath or: [entry isNil]) 
		ifTrue: [absentBlock value]
		ifFalse: [
			entry at: 1 put: aPath basename.
			presentBlock value: entry ].