converting
asConflicts
	^ (self class newFrom: self)
		hasConflicts: true;
		yourself