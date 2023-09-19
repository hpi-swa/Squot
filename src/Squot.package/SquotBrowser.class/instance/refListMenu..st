menu
refListMenu: aMenu
	self commitMenu: aMenu.
	aMenu target: self.
	(self activeRef notNil and: [(self workingCopy isSqueakBranchRef: self activeRef)]) ifTrue: [
		aMenu add: 'switch to this branch' action: #actionSwitchToActiveBranch].
	^ aMenu