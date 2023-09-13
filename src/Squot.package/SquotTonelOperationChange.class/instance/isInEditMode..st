accessing
isInEditMode: aBoolean
	super isInEditMode: aBoolean.
	self changed: #text.