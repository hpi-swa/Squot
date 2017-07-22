testing
testSameReferencedInstance
	| array1 array2 restored same shadow1 shadow2 |
	same := Object new.
	array1 := {same}.
	shadow1 := capturer captureStandalone: array1.
	restored := materializer rematerialize: shadow1.
	self assert: (restored at: 1) == same.
	array2 := {1. same}.
	shadow2 := capturer captureStandalone: array2.
	restored := materializer rematerialize: shadow2.
	self assert: (restored at: 2) == same.