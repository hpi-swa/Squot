capturing
capture: anObject asValueOfSlot: aShadowSlot
	| name shadow namedObject namedShadow |
	state == #enumerating
		ifTrue: [ | decorated |
			objectCreatorMapping at: anObject ifAbsentPut:
				[objectCreatorSlotMapping at: anObject put: aShadowSlot.
				enumeratedObject].
			decorated := SquotCreatorDecorator on: anObject creator: enumeratedObject slot: aShadowSlot.
			^ toBeVisited add: decorated].
	name := objectNameMapping at: anObject.
	shadow := convertedObjects at: anObject.
	toBeVisited add: (namedObject := SquotNameDecorator on: anObject withName: name).
	aShadowSlot value: (namedShadow := SquotNameDecorator on: shadow withName: name).
	^ namedShadow