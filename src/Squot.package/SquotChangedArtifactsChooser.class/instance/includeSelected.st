operations
includeSelected
	(list at: selection) value: (self proposedOf: self selection).
	self listChanged.