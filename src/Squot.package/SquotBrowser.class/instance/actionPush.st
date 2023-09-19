actions
actionPush
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self activeRef ifNil: [^ self inform: 'Select a ref first.'].
	(self activeWorkingCopy isSqueakBranchRef: self activeRef) ifFalse: [
		(UIManager default confirm:
			('The active ref ''{1}'' is not a branch. Push anyway?'
				format: {self activeRef}))
			ifFalse: [^ self]].
	self activeWorkingCopy pushRef: self activeRef.