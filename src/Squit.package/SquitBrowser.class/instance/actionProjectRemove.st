actions on working copies
actionProjectRemove
	| workingCopy |
	workingCopy := self projectSelection ifNil: [^ self].
	(self confirm: 'Really delete project ', workingCopy name, '?')
		ifFalse: [^ self].
	workingCopy unregister.
	self projectIndex: (self projectIndex min: self projectList size).