enumerating
show: aGraphWalk nextAfter: aTriple
	"Queue all objects reachable from the objects in aTriple in the graph walk."
	| workingObject incomingObject baseObject |
	workingObject := aTriple first.
	incomingObject := aTriple second.
	baseObject := aTriple third.
	(workingObject ifNil: [#()] ifNotNil: [workingObject squotOutgoingReferences]) do:
		[:each |
		aGraphWalk
			add: {each value.
				each value sameIn: incoming asIn: working ifAbsent: [].
				each value sameIn: base asIn: working ifAbsent: []}
			reachedVia: each].
	(incomingObject ifNil: [#()] ifNotNil: [incomingObject squotOutgoingReferences]) do:
		[:each |
		 aGraphWalk add: {each value sameIn: working asIn: incoming ifAbsent: [].
				each value.
				each value sameIn: base asIn: incoming ifAbsent: []}
			reachedVia: each].
	(baseObject ifNil: [#()] ifNotNil: [baseObject squotOutgoingReferences]) do:
		[:each |
		 aGraphWalk add: {each value sameIn: working asIn: base ifAbsent: [].
				each value sameIn: incoming asIn: base ifAbsent: [].
				each value}
			reachedVia: each].