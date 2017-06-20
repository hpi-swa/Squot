converting
capture: anObject as: shadowObjectFactory
	convertedObjects at: anObject
		ifPresent: [:it | ^ it]
		ifAbsent: [ | newShadow |
			newShadow := shadowObjectFactory new.
			convertedObjects at: anObject put: newShadow.
			newShadow initializeFrom: anObject with: self.
			^ newShadow]