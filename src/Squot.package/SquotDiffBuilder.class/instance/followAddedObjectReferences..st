private
followAddedObjectReferences: aShadow
	aShadow squotOutgoingReferences
		do: [:each | | name leftShadow |
			(name := (right nameOf: each value ifAbsent: [])) ifNotNil:
				[(leftShadow := left shadowNamed: name ifAbsent: []) ifNotNil:
					[self addToBeVisitedLeft: leftShadow right: each value]]].