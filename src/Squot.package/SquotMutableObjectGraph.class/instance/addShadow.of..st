adding
addShadow: aShadow of: anObject
	| name |
	name := self nameOf: anObject ifAbsent: [^ aShadow].
	self assert: anObject canHaveNameAssignedBySquot
		description: 'Primitive objects should not get names'.
	shadows at: name put: aShadow undecorated.
	self answer: name whenAskedForTheNameOf: aShadow undecorated.
	^ aShadow