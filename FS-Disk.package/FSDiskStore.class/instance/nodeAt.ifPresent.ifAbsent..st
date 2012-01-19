private
nodeAt: aPath ifPresent: presentBlock ifAbsent: absentBlock
	
	| name|
	
	aPath isRoot ifTrue: [ ^ presentBlock value: self rootNode ].
	
	"| encodedPath encodedBasename entry |
	encodedPath := Primitives encode: (self stringFromPath: aPath parent).
	encodedBasename := Primitives encode: aPath basename.
	entry := Primitives lookupDirectory: encodedPath filename: encodedBasename.
	
	^ entry == #badDirectoryPath 
		ifTrue: absentBlock
		ifFalse: [
			entry at: 1 put: aPath basename.
			presentBlock value: entry ]."
		
	name := aPath basename.
	self
		directoryAt: aPath parent
		ifAbsent: absentBlock
		nodesDo: 
			[ :entry | 
			(self filename: (entry at: 1) matches: name)
				ifTrue: [ ^ presentBlock value: entry ] ].
	^ absentBlock value