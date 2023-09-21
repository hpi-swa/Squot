menu
refListMenu: aMenu
	self activeRef ifNil: [^ aMenu].
	self commitMenu: aMenu.
	aMenu target: self.
	(self activeWorkingCopy isSqueakBranchRef: self activeRef) ifTrue: [
		aMenu add: 'switch to this branch' action: #actionSwitchToActiveBranch].
	^ aMenu