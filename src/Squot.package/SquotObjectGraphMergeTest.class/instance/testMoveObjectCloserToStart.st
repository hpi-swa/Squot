tests
testMoveObjectCloserToStart
	"If an object is moved closer to the start object, the comparison walk will encounter it sooner. This must not cause trouble with the mirror lookups."
	| merge o1 o2 o3 |
	o1 := {o2 := {o3 := {42}}}.
	merge := self mergeOf: o1 withChanges: [o1 at: 1 put: o3].
	self assert: (merge includesMergeAt: (objectRegistry nameOf: o1));
		deny: (merge includesModificationAt: (objectRegistry nameOf: o3)).
	"Now try with new references instead of changing an existing reference."
	o1 := Set newFrom: {o2}.
	merge := self mergeOf: o1 withChanges: [o1 add: o3; remove: o2]. "Should not raise an error. Did not wrap in shouldnt:raise: because without it is easier to debug."