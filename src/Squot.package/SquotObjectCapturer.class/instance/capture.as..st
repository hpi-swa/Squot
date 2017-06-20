capturing
capture: anObject as: shadowObjectFactory
	| shadow |
	state == #enumerating
		ifTrue: [^ self enumerate: anObject shadowFactory: shadowObjectFactory].
	shadow := convertedObjects at: anObject.
	(visited includes: anObject) ifTrue: [^ shadow].
	visited add: anObject.
	^ shadow
		initializeFrom: anObject with: self;
		yourself