private
rememberAsShadowOfCapturedObject: newShadow
	| decoratedShadow |
	decoratedShadow := SquotNameDecorator on: newShadow
		withName: (objectGraph nameOf: capturedObject ifAbsent: [  ]).
	convertedObjects at: capturedObject put: decoratedShadow.
	"Redirect slots from live objects to shadows."
	(slotsToConvert removeKey: capturedObject ifAbsent: [#()]) do:
		[:each | | shadowMirror shadowReference shadowReferrer |
		shadowReferrer := each first.
		shadowMirror := each second.
		shadowReference := each third.
		shadowMirror reflect: shadowReference of: shadowReferrer put: decoratedShadow].