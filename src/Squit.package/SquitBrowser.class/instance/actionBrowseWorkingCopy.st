actions on working copies
actionBrowseWorkingCopy
	| workingCopy |
	(workingCopy := self projectSelection) ifNil: [^ self].
	workingCopy browse.