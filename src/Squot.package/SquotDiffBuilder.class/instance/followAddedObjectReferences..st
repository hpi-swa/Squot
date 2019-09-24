private
followAddedObjectReferences: aShadow
	aShadow squotOutgoingReferences
		do: [:each | | name leftShadowOrNil |
			(name := (right nameOf: each value undecorated ifAbsent: [])) ifNotNil:
				[leftShadowOrNil := left shadowNamed: name ifAbsent: [].
				leftShadowOrNil
					ifNil: [self addedObject: each value withName: name]
					ifNotNil: [self addToBeVisitedLeft: leftShadowOrNil right: each value]]].