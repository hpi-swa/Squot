actions on working copies
actionRemoteAdd
	| workingCopy |
	workingCopy := self projectSelection ifNil: [^ self].
	(SquitInteractiveAddRemote new
		repository: workingCopy repository;
		run)
			then: [:ignored | self refresh].