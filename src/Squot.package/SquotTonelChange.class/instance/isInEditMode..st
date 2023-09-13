accessing
isInEditMode: aBoolean
	isInEditMode := aBoolean.
	self dependentTextMorphs do: [:each | each readOnly: self isReadOnly].
	self changed: #editButtonLabel.