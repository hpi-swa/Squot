operations
excludeSelected
	(list at: selection) value: (self originalOf: self selection).
	self listChanged.