actions on working copies
actionRemoteAdd
	| workingCopy query |
	workingCopy := self projectSelection ifNil: [^ self].
	(query := SquitAddRemote new)
		workingCopy: workingCopy;
		afterCloseContinueIn: self with: #actionRemoteAddContinue:.
	ToolBuilder open: query.