accessing
selectedChangePart: anObject
	selectedChangePart := anObject.
	self
		changed: #selectedChangePart;
		changed: #buildChangePane.