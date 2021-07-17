testing
testDictionary
	| a b sh graphBefore graphAfter diff removedAssociation changedAssociation |
	"given"
	a := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (sh := StringHolder new contents: 'old'; yourself)}.
	b := Dictionary newFrom: {1 -> 3. 'fuu' -> (a at: 'foo'). #bla -> (StringHolder new contents: 'new')}.
	graphBefore := capturer captureGraph: a.
	objectRegistry assign: (objectRegistry nameOf: a) to: b;
		 assign: (objectRegistry nameOf: (a at: #bla)) to: (b at: #bla).
	a keysDo: [:each | (b includesKey: each) ifTrue: [objectRegistry assign: (objectRegistry nameOf: (a associationAt: each)) to: (b associationAt: each)]].
	graphAfter := capturer captureGraph: b.
	diff := graphBefore squotDiffAgainst: graphAfter.
	changedAssociation := a associationAt: 1.
	removedAssociation := a associationAt: 'foo'.
	self assert: (b at: 'fuu') == removedAssociation value.
	"when"
	self apply: diff to: a.
	"then"
	self assert: 3 equals: (a at: 1).
	self deny: (a includesKey: removedAssociation key).
	self assert: 'new' equals: (a at: #bla) contents.
	self assert: changedAssociation == (a associationAt: 1).
	self assert: (a at: 'fuu') == removedAssociation value.
	self assert: (a at: #bla) == sh. "Still the same"