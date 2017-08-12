private
rememberAsShadowOfCapturedObject: newShadow
	| decoratedShadow |
	decoratedShadow := SquotNameDecorator on: newShadow
		withName: (objectGraph nameOf: capturedObject ifAbsent: [  ]).
	convertedObjects at: capturedObject put: decoratedShadow.