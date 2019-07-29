public converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [ | materialized |
			self assert: (aShadow hasSquotShadowName not or: [sourceGraph includes: aShadow undecorated])
				description: 'Source graph does not contain shadow. Where does it come from?'.
			materialized := self findOrCreateAndRematerialize: aShadow.
			materialized shouldHaveNameAssignedBySquot ifTrue:
				[(targetGraph notNil and: [sourceGraph notNil]) ifTrue:
					[targetGraph
						assign: (sourceGraph nameOf: aShadow undecorated
									ifAbsent: [aShadow hasSquotShadowName
												ifTrue: [aShadow name]
												ifFalse: [self error: 'Object has no name']])
						to: materialized]].
			materialized]