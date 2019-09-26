public converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [ | materialized name |
			self assert: (aShadow hasSquotShadowName not or: [sourceGraph includesObjectNamed: aShadow name])
				description: 'Source graph does not contain shadow. Where does it come from?'.
			materialized := self findOrCreateAndRematerialize: aShadow.
			name := sourceGraph nameOf: aShadow undecorated ifAbsent: [].
			(name isNil and: [aShadow hasSquotShadowName]) ifTrue:
				[name := aShadow name].
			(name isNil and: [materialized shouldHaveNameAssignedBySquot]) ifTrue:
				[self error: 'Object has no name but it should have'].
			name ifNotNil: [targetGraph assign: name to: materialized].
			materialized]