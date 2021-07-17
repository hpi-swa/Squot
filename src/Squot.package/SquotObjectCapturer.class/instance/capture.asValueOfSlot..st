capturing
capture: anObject asValueOfSlot: aShadowSlot
	| captureObject name namedObject decorated |
	self flag: #deprecated. "Use capture: anObject asValueOf: aReference from: referrerObject reflectedIn: aMirror intoValueOf: shadowsReference from: referrerShadow reflectedIn: aShadowMirror instead"
	captureObject := self replacementForSlot: aShadowSlot in: enumeratedObject
		ifFound: [:replacement | replacement]
		ifNone: [anObject undecorated].
	decorated := SquotCreatorDecorator on: captureObject
				creator: (enumeratedObject squotDecoratedLike: capturedObjectWithReferrer)
				slot: aShadowSlot.
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