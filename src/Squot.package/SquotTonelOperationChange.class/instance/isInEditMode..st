accessing
isInEditMode: aBoolean
	super isInEditMode: aBoolean.
	self changed: #operationText.