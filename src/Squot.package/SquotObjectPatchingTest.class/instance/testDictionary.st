testing
testDictionary
	| dict graphBefore graphAfter diff newDict removedAssociation materializer newLoadedGraph changedAssociation |
	"given"
	dict := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (StringHolder new contents: 'old'; yourself)}.
	graphBefore := capturer captureGraph: dict.
	removedAssociation := dict associationAt: 'foo'.
	dict at: 1 put: 3;
		at: 'fuu' put: (dict at: 'foo');
		removeKey: 'foo'.
	(dict at: #bla) contents: 'new'.
	self assert: (dict at: 'fuu') == removedAssociation value.
	graphAfter := capturer captureGraph: dict.
	diff := graphBefore squotDiffAgainst: graphAfter.
	"when"
	materializer := SquotShadowMaterializer new.
	materializer sourceGraph: graphBefore.
	materializer targetGraph: graphBefore asShadowGraph mutableCopy.
	newDict := materializer rematerialize: graphBefore startShadow.
	changedAssociation := newDict associationAt: 1.
	removedAssociation := newDict associationAt: 'foo'.
	newLoadedGraph := materializer objectGraph.
	diff squotApplyToLoaded: newLoadedGraph.
	"then"
	self assert: 3 equals: (newDict at: 1).
	self deny: (newDict includesKey: removedAssociation key).
	self assert: 'new' equals: (newDict at: #bla) contents.
	self assert: changedAssociation == (newDict associationAt: 1).
	self assert: (newDict at: 'fuu') == removedAssociation value.