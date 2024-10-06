accessing
isResolved: aBoolean
	isResolved := aBoolean.
	self
		changed: #isResolved;
		changed: #hasConflicts.