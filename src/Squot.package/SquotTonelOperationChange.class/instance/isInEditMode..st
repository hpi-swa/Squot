accessing
isInEditMode: aBoolean
	isInEditMode := aBoolean.
	self
		changed: #operationText;
		changed: #editButtonLabel.