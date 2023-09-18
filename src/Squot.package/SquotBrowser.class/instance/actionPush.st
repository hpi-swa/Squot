actions
actionPush
	self activeRef ifNil: [^ self inform: 'Select a ref first.'].
	(self workingCopy isSqueakBranchRef: self activeRef) ifFalse: [
		(UIManager default confirm:
			('The active ref ''{1}'' is not a branch. Push anyway?'
				format: {self activeRef}))
			ifFalse: [^ self]].
	self workingCopy pushRef: self activeRef.