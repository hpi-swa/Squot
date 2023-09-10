accessing
isInEditMode: aBoolean
	isInEditMode := aBoolean.
	self updateText.
	self changed: #editButtonLabel.