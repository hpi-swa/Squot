accessing
sourceTextMorphs
	^ self dependents select: [:each |
		each isTextView and: [each model isKindOf: SquotCodeChangeIndexedModel]]