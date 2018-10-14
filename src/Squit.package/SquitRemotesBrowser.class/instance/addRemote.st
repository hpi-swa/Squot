actions
addRemote
	| query |
	(query := SquitAddRemote new)
		workingCopy: workingCopy;
		afterCloseContinueIn: self with: #continueAddRemote:.
	ToolBuilder open: query.