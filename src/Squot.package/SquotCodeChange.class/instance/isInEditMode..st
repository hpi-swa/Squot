accessing
isInEditMode: aBoolean
	isInEditMode := aBoolean.
	self sourceTextMorphs do: [:each | each readOnly: self isReadOnly].
	self changed: #editButtonLabel.