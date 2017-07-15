actions on working copies
actionProjectRemove
	self projectSelection ifNil: [^ self].
	(UIManager confirm: 'Really delete project ', self projectSelection name, '?')
		ifFalse: [^ self].
	self projectSelection unregister.
	self refresh.