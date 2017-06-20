capturing
capture: anObject asValueOfSlot: aShadowSlot
	| name shadow namedObject namedShadow |
	state == #enumerating
		ifTrue: [ | decorated |
			decorated := SquotCreatorDecorator on: anObject creator: enumeratedObject slot: aShadowSlot.
			decoratedObjects at: anObject ifAbsentPut: [decorated].
			^ toBeVisited add: decorated].
	name := objectNameMapping at: anObject.
	shadow := convertedObjects at: anObject.
	toBeVisited add: (namedObject := SquotNameDecorator on: anObject withName: name).
	decoratedObjects at: anObject put: namedObject.
	aShadowSlot value: (namedShadow := SquotNameDecorator on: shadow withName: name).
	decoratedObjects at: shadow put: namedShadow.
	^ namedShadow