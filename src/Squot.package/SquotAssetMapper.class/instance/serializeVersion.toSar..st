sar
serializeVersion: anObject toSar: aSarBuilder
	| pathString serialized |
	serialized := self serializeVersion: anObject.
	pathString := SquotPathUtilities asRelativeString: self path.
	aSarBuilder addString: serialized at: pathString.
	^ '({1} readVersionFrom: (self memberNamed: {2}) contentStream)'
		format: {self storeString. pathString printString}