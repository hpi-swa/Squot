capturing
capture: anObject
	| shadow decoratedShadow |
	shadow := anObject captureWithSquot: self.
	decoratedShadow := SquotNameDecorator
			on: shadow
			withName: (objectGraph nameOf: capturedObject ifAbsent: []).
	convertedObjects at: capturedObject put: decoratedShadow.
	objectGraph addShadow: shadow of: capturedObject.
	^ shadow