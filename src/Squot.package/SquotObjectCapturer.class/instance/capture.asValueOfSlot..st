capturing
capture: anObject asValueOfSlot: aShadowSlot
	| captureObject name namedObject decorated |
	captureObject := self replacementForSlot: aShadowSlot in: enumeratedObject
		ifFound: [:replacement | replacement]
		ifNone: [anObject].
	decorated := SquotCreatorDecorator on: captureObject
				creator: enumeratedObject slot: aShadowSlot.
	objectGraph creatorOf: captureObject
				ifAbsentPut: [aShadowSlot] of: [enumeratedObject].
	name := captureObject shouldHaveNameAssignedBySquot
		ifTrue: [objectGraph nameOf: captureObject
				ifAbsentAssign: [self newNameFor: decorated]].
	convertedObjects at: captureObject
		ifPresent: [:existingShadow | aShadowSlot value: existingShadow]
		ifAbsent:
			[namedObject := SquotNameDecorator on: captureObject withName: name.
			aShadowSlot value: namedObject.
			toBeVisited add: decorated.
			slotsToConvert add: aShadowSlot].
	^ aShadowSlot