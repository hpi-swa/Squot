actions
actionPush: refString
	self activeWorkingCopyIfNilInformAnd: [^ self].
	(self activeWorkingCopy isSqueakBranchRef: refString) ifFalse: [
		(UIManager default confirm:
			('The active ref ''{1}'' is not a branch. Push anyway?'
				format: {refString}))
			ifFalse: [^ self]].
	self activeWorkingCopy pushRef: refString.