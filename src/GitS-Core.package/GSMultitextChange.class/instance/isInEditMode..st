accessing
isInEditMode: aBoolean
	isInEditMode := aBoolean.
	self sourceTextMorphs do: [:each | each readOnly: (self isReadOnly: each model index)].
	self changed: #editButtonLabel.