actions on versions
actionCommitRevert
	| revertedVersion workingCopy |
	(self hasProjectSelection and: [self hasCommitSelection]) ifFalse: [^ self].
	revertedVersion := self commitSelection.
	workingCopy := self projectSelection.
	self revert: revertedVersion inWorkingCopy: workingCopy.