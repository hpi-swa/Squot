capturing
captureReferences: aCollection from: anObject into: anObjectShadow with: aCapturer
	aCollection do:
		[:each | | captured objectMirror |
		captured := each asCapturedReference.
		captured reflect: anObjectShadow in: self put: nil.
		objectMirror := aCapturer mirrorOf: anObject.
		aCapturer
			capture: (each reflect: anObject in: objectMirror)
			asValueOf: each
			from: anObject
			reflectedIn: objectMirror
			intoValueOf: captured
			from: anObjectShadow
			reflectedIn: self].