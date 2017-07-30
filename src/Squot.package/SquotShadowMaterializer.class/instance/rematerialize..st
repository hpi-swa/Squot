public converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [ | materialized |
			materialized := self findOrCreateAndRematerialize: aShadow.
			materialized shouldHaveNameAssignedBySquot ifTrue:
				[(targetGraph notNil and: [sourceGraph notNil]) ifTrue:
					[targetGraph
						assign: (sourceGraph nameOf: aShadow undecorated)
						to: materialized]].
			materialized]