reading
upTo: anObject
	"Answer a subcollection from the current access position to the 
	occurrence (if any, but not inclusive) of the given object. If 
	no matching object is found, answer the entire rest of the receiver."
	| next |
	^self collectionSpecies streamContents:
		[:out |
		[self atEnd or: [(next := self next) = anObject]]
			whileFalse: [out nextPut: next]]