testing
testSameReferencedInstance
	| array1 array2 restored same shadow1 shadow2 |
	same := Object new.
	array1 := {same}.
	shadow1 := capturer captureGraph: array1.
	restored := materializer rematerializeGraph: shadow1 asShadowGraph.
	self assert: (restored at: 1) == same.
	array2 := {1. same}.
	shadow2 := capturer captureGraph: array2.
	restored := materializer rematerializeGraph: shadow2.
	self assert: (restored at: 2) == same.