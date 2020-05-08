actions on versions
actionCommitNewCherryPick
	| pickedVersion workingCopy |
	pickedVersion := self commitSelection.
	workingCopy := self projectSelection.
	self cherryPick: pickedVersion toWorkingCopy: workingCopy.