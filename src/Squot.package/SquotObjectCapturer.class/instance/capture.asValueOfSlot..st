capturing
capture: anObject asValueOfSlot: aShadowSlot
	| name shadow namedObject namedShadow |
	state == #enumerating
		ifTrue: [ | decorated |
			objectRegistry creatorOf: anObject
				ifAbsentPut: [aShadowSlot] of: [enumeratedObject].
			decorated := SquotCreatorDecorator on: anObject creator: enumeratedObject slot: aShadowSlot.
			^ toBeVisited add: decorated].
	name := objectRegistry nameOf: anObject ifAbsent: [nil].
	shadow := convertedObjects at: anObject.
	toBeVisited add: (namedObject := SquotNameDecorator on: anObject withName: name).
	aShadowSlot value: (namedShadow := SquotNameDecorator on: shadow withName: name).
	^ aShadowSlot