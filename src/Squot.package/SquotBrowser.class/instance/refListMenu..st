menu
refListMenu: aMenu
	self activeWorkingCopy ifNil: [^ aMenu].
	self commitMenu: aMenu.
	aMenu target: self.
	(self activeRef notNil and: [(self activeWorkingCopy isSqueakBranchRef: self activeRef)]) ifTrue: [
		aMenu add: 'switch to this branch' action: #actionSwitchToActiveBranch].
	^ aMenu