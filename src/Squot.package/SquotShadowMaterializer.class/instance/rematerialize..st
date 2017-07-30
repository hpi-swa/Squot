public converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [ | materialized |
			materialized := self findOrCreateAndRematerialize: aShadow.
			materialized shouldHaveNameAssignedBySquot ifTrue:
				[targetGraph ifNotNil: [targetGraph assign: (sourceGraph nameOf: aShadow undecorated) to: materialized]].
			materialized]