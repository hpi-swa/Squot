private
enumerate: anObject shadowFactory: shadowObjectFactory
	| newShadow |
	(convertedObjects includesKey: anObject) ifTrue: [^ self].
	newShadow := shadowObjectFactory new.
	convertedObjects at: anObject put: newShadow.
	enumeratedObject := decoratedObjects at: anObject.
	newShadow initializeFrom: anObject with: self.