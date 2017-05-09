actions
actionProjectRemove
	self hasProjectSelection ifFalse: [^ self].
	(UIManager confirm: 'Really delete project ', self projectSelection name, '?')
		ifFalse: [^ self].
	self projectSelection unregister.
	self refresh.