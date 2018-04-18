actions on working copies
actionProjectRename
	| workingCopy name |
	workingCopy := self projectSelection.
	name := UIManager default
		request: 'Enter new project name:'
		initialAnswer: workingCopy name.
	name ifEmpty: [^ self].
	workingCopy name: name.
	self refresh.