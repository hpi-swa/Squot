actions
actionProjectAdd
	self addProjectIfCanceled: [^ self].
	self refresh.