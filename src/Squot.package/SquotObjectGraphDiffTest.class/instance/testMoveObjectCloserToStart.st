tests
testMoveObjectCloserToStart
	"If an object is moved closer to the start object, the comparison walk will encounter it sooner. This must not cause trouble with the mirror lookups."
	| diff o1 o2 o3 |
	o1 := {o2 := {o3 := {42}}}.
	diff := self diff: o1 againstItselfAfter: [o1 at: 1 put: o3].
	self assert: (diff diffForObjectNamed: (objectRegistry nameOf: o1) ifAbsent: []) notNil;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: o3) ifAbsent: []) isNil.
	"Now try with new references instead of changing an existing reference."
	o1 := Set newFrom: {o2}.
	diff := self diff: o1 againstItselfAfter: [o1 add: o3; remove: o2]. "Should not raise an error. Did not wrap in shouldnt:raise: because without it is easier to debug."