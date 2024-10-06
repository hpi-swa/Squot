actions
actionRenameActiveProject
	| workingCopy |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	workingCopy rename.
	self activeWorkingCopy: workingCopy. "gets reset to nil during rename"