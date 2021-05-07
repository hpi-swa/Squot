actions on versions
actionCommitCherryPick
	| pickedVersion workingCopy |
	(self hasProjectSelection and: [self hasCommitSelection]) ifFalse: [^ self].
	pickedVersion := self commitSelection.
	workingCopy := self projectSelection.
	self cherryPick: pickedVersion toWorkingCopy: workingCopy.