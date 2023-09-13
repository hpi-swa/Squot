accessing
dependentTextMorphs
	^ self dependents select: [:each | each isTextView]