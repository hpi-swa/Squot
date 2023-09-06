accessing
selectedChange: anObject
	selectedChange := anObject.
	self
		changed: #selectedChange;
		changed: #buildChange:.