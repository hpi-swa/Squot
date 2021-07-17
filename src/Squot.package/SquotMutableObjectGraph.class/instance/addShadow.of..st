adding
addShadow: aShadow of: anObject
	| name |
	name := self nameOf: anObject ifAbsent: [^ aShadow].
	self assert:
		((name = self class anonymousObjectName "presumably the start object"
			and: [(self objectNamed: name) == anObject])
			or: [anObject shouldHaveNameAssignedBySquot flag: #todo "Should use mirrors instead."])
		description: 'Primitive objects should not get names'.
	shadows at: name put: aShadow undecorated.
	self answer: name whenAskedForTheNameOf: aShadow undecorated.
	^ aShadow