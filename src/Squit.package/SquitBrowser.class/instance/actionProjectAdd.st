actions on working copies
actionProjectAdd
	self addProjectIfCanceled: [^ self].
	self refresh.