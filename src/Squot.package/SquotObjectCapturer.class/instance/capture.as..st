capturing
capture: anObject as: shadowObjectFactory
	state == #enumerating
		ifTrue: [^ self enumerate: anObject shadowFactory: shadowObjectFactory].