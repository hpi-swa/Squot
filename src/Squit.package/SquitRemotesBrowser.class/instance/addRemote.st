actions
addRemote
	| query |
	(query := SquitAddRemote new)
		workingCopy: workingCopy;
		afterCloseContinueIn: self with: #continueAddRemote:.
	query open.