accessing
isResolved: aBoolean
	isResolved := aBoolean.
	self
		changed: #headerText;
		changed: #hasConflicts.