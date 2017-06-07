ansi gettable
upTo: anObject 
	| element |
	^ self collectionSpecies streamContents:
		[:out |
		[self atEnd or: [(element := self next) = anObject]]
			whileFalse: [out nextPut: element]]