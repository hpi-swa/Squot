enumerating
show: aGraphWalk nextAfter: aTriple
	| workingObject incomingObject baseObject |
	workingObject := aTriple first.
	incomingObject := aTriple second.
	baseObject := aTriple third.
	workingObject squotOutgoingReferences do:
		[:each | aGraphWalk nextPut: {each. nil. nil}].