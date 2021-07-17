capturing
captureReferences: aCollection from: anObject reflectedIn: aMirror into: anObjectShadow with: aCapturer
	aCollection do:
		[:each | | captured |
		captured := each asCapturedReference.
		captured reflect: anObjectShadow in: self put: nil.
		aCapturer
			capture: (each reflect: anObject in: aMirror)
			asValueOf: each
			from: anObject
			reflectedIn: aMirror
			intoValueOf: captured
			from: anObjectShadow
			reflectedIn: self].