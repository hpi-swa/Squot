capturing
capture: anObject asValueOf: aReference from: referrerObject reflectedIn: aMirror intoValueOf: shadowsReference from: referrerShadow reflectedIn: aShadowMirror
	| captureObject name namedObject referencedObjectMirror |
	captureObject := self replacementForSlot: aReference in: referrerObject
		ifFound: [:replacement | replacement]
		ifNone: [anObject undecorated].
	objectGraph creatorOf: captureObject ifAbsentPut: [aReference] of: [referrerObject].
	name := ((referencedObjectMirror := aMirror mirror: aReference of: referrerObject) shouldObjectHaveNameAssigned: captureObject)
		ifTrue: [objectGraph nameOf: captureObject
				ifAbsentAssign: [self newNameFor: anObject reachedFrom: referrerObject via: aReference]].
	convertedObjects at: captureObject
		ifPresent: [:existingShadow | aShadowMirror reflect: shadowsReference of: referrerShadow put: existingShadow]
		ifAbsent:
			[namedObject := SquotNameDecorator on: captureObject withName: name.
			aShadowMirror reflect: shadowsReference of: referrerShadow put: namedObject. "Tempory, until capturedObject is really captured later during the walk."
			walk add: captureObject -> referencedObjectMirror reachedVia: aReference.
			slotsToConvert add: {referrerShadow. aShadowMirror. shadowsReference. referrerObject. aMirror. aReference}].
	^ captureObject