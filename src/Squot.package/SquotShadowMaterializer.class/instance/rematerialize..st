public converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [ | materialized |
			materialized := self findOrCreateAndRematerialize: aShadow.
			materialized shouldHaveNameAssignedBySquot ifTrue:
				[objectGraph ifNotNil: [objectGraph assign: aShadow name to: materialized]].
			materialized]