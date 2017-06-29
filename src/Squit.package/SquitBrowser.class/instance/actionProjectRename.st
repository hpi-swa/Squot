actions on working copies
actionProjectRename
	| name |
	name := UIManager default
		request: 'Enter new project name:'
		initialAnswer: self projectSelection name.
	name ifEmpty: [^ self].
	self projectSelection name: name.
	self refresh.